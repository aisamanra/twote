#!/usr/bin/env ruby
# typed: strict

require "fileutils"
require "json"
require "mini_magick"
require "mustache"
require "pathname"
require "sprinkles/opts"
require "sorbet-runtime"
require "time"

class Module
  include T::Sig
  extend T::Sig
end

module Twote
  class Options < Sprinkles::Opts::GetOpt
    sig { override.returns(String) }
    def self.program_name
      "twote"
    end

    const :root_path, String
    const :destination, String
    const :date_cutoff, T.nilable(String), short: "c", long: "cutoff"
    const :convert_media, T::Boolean, short: "m", long: "media", factory: -> { false }
  end

  class Image < T::Struct
    const :name, String

    sig { returns(String) }
    def self.template
      @template = T.let(@template, T.nilable(String))
      @template ||= File.read("templates/img.mustache")
    end

    sig { returns(String) }
    def embed
      Mustache.render(self.class.template, self)
    end
  end

  class Video < T::Struct
    const :type, String
    const :name, String

    sig { returns(String) }
    def self.template
      @template = T.let(@template, T.nilable(String))
      @template ||= File.read("templates/video.mustache")
    end

    sig { returns(String) }
    def embed
      Mustache.render(self.class.template, self)
    end
  end

  class Tweet < T::Struct
    const :tweet_id, String
    const :reply, T::Boolean
    const :text, String
    const :media, T.nilable(T::Array[T.any(Image, Video)])
    const :time, Time
    const :original, String

    sig { returns(String) }
    def display_time
      time.strftime("%Y-%m-%d %H:%M")
    end
  end

  sig { void }
  def self.main
    opts = Options.parse
    root = Pathname.new(opts.root_path)
    output = Pathname.new(opts.destination)

    template = File.read("templates/main.mustache")

    data = File.open(root / "tweets.js") do |f|
      # get rid of the Javascript nonsense and turn this into just
      # plain ol' JSON
      raw = T.must(f.read).gsub("window.YTD.tweets.part0 = ", "")
      JSON.load(raw)
    end

    tweets = data
      .map do |t|
        # skip retweets
        next if t.dig("tweet", "full_text")&.start_with?("RT ")
        # convert to the format we're gonna throw at Mustache
        tweet_data(root, t)
      end
      .compact
      .sort_by(&:time)
      .reverse

    # if a date cutoff is provided, then reject tweets that are older
    # than it
    if (date = opts.date_cutoff)
      date = Time.parse(date)
      tweets.reject! do |t|
        t.time < date
      end
    end

    # puts tweets
    FileUtils.mkdir_p(output)
    target = output / "index.html"
    $stderr.puts("Writing to #{target}")
    File.open(target, "w") do |index|
      index.write(Mustache.render(template, {tweets: tweets}))
    end

    if opts.convert_media
      # for development purposes, we only do this on-demand (e.g. so
      # if you're mucking with the template then we don't churn
      # through all the thumbnails instead)
      $stderr.puts("Moving and resizing media files")

      FileUtils.mkdir_p(output / "media")
      Dir[root / "tweets_media" / "*"].each do |entry|
        basename = File.basename(entry)
        FileUtils.cp(entry, output / "media" / basename)
        # this will fail for videos; that's fine
        if entry.to_s.end_with?(".jpg", ".png", ".gif")
          img = MiniMagick::Image.open(entry)
          img.resize("300x300>")
          img.write(output / "media" / "thumb-#{basename}")
        end
      end
    end
  end

  sig { params(root: Pathname, tweet_id: String, variants: T::Array[T.untyped]).returns(T.nilable(Video)) }
  def self.find_video(root, tweet_id, variants)
    # okay, so: Twitter gives a bunch of variants only one of which is
    # canonical and stored in the data archive. I'll bet there's a way
    # of figuring out based on bitrate and whatnot which one is, but I
    # don't know how reliable that is. So instead, what I do is: for
    # each one, find out (based on munging the filenames) whether it's
    # actually the one that was provided in the media folder. If so,
    # that's the one we want!
    variants.each do |variant|
      type = variant["content_type"]
      fragment, _ = variant["url"].split("/").last.split("?")
      basename = "#{tweet_id}-#{fragment}"
      if (root / "tweets_media" / basename).exist?
        return Video.new(
          type: type,
          name: basename
        )
      end
    end

    return nil
  end

  sig { params(root: Pathname, tweet: T.untyped).returns(T.nilable(Tweet)) }
  def self.tweet_data(root, tweet)
    tweet = tweet["tweet"]
    tweet_id = tweet["id"]

    # start with the basic tweet text, but with newlines observed
    tweet_text = tweet["full_text"].gsub("\n", "<br/>")
    is_reply = tweet_text.start_with?("@")

    # the issue with replacements is we need to do them back-to-front,
    # because they throw off the indices if we do the earlier ones
    # first, but the entities are all of different varieties. We'll
    # accumulate the various replacements we want to do here and
    # stitch them in together later
    replacements = T::Array[[Integer, Integer, String]].new

    # the "media" we're replacing here is the trailing link to the
    # images. We'll include the images ourselves, so that's not
    # necessary
    tweet.dig("entities", "media")&.each do |media|
      from, to = media["indices"].map(&:to_i)
      replacements << [from, to, ""]
    end

    # for links, we do want to replace them with the actual link, not
    # the Twitter-shortened link.
    tweet.dig("entities", "urls")&.each do |url|
      from, to = url["indices"].map(&:to_i)
      href = url["expanded_url"]
      disp = url["display_url"]
      replacements << [from, to, "<a href=\"#{href}\">#{disp}</a>"]
    end

    # for user mentions, we'll go ahead and link back to the Twitter
    # profile of the relevant user. (If they still exist, anyway.)
    tweet.dig("entities", "user_mentions")&.each do |user|
      from, to = user["indices"].map(&:to_i)
      name = user["screen_name"]
      link = "<a href=\"https://twitter.com/#{name}\">@#{name}</a>"
      replacements << [from, to, link]
    end

    # Just print hashtags pretty. I'm not bothering doing anything
    # smarter here for now, because I personally didn't use them much.
    tweet.dig("entities", "hashtags")&.each do |hashtag|
      from, to = hashtag["indices"].map(&:to_i)
      name = hashtag["text"]
      replacements << [from, to, "<span class=\"hashtag\">##{name}</span>"]
    end

    # now, go through replacements last-to-first and stitch the text
    # bcak in
    replacements.sort_by(&:first).reverse.each do |from, to, str|
      tweet_text[from...to] = str
    end

    # find all the associated media objects
    media_objects = tweet.dig("extended_entities", "media")&.map do |m|
      if m["type"] == "video"
        # videos are special: see `find_video` for why
        v = find_video(root, tweet_id, m.dig("video_info", "variants"))
        return nil if v.nil?
        v
      else
        # otherwise, we just need to find the URL on disk, which is
        # easy enough.
        filename = m["media_url"].split("/").last
        Image.new(
          name: "#{tweet_id}-#{filename}"
        )
      end
    end

    Tweet.new(
      tweet_id: tweet_id,
      reply: is_reply,
      text: tweet_text,
      time: Time.parse(tweet["created_at"]),
      media: media_objects,
      original: "https://twitter.com/aisamanra/status/#{tweet_id}"
    )
  end
end

if File.expand_path($PROGRAM_NAME) == __FILE__
  Twote.main
end
