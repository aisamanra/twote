#!/usr/bin/env ruby
# typed: strict

require "fileutils"
require "json"
require "mustache"
require "pathname"
require "sorbet-runtime"
require "time"

class Module
  include T::Sig
  extend T::Sig
end

module Twote
  class Image < T::Struct
    const :path, Pathname

    sig { returns(String) }
    def embed
      "<img src=#{path}/>"
    end
  end

  class Video < T::Struct
    const :type, String
    const :path, Pathname

    sig { returns(String) }
    def embed
      <<~RB
        <video controls>
          <source src="#{path}" type="#{type}">
        </video>
      RB
    end
  end

  class Tweet < T::Struct
    const :tweet_id, String
    const :reply, T::Boolean
    const :text, String
    const :media, T.nilable(T::Array[T.any(Image, Video)])
    const :time, Time

    sig { returns(String) }
    def display_time
      time.strftime("%Y-%m-%d %H:%M")
    end
  end

  sig { params(root: Pathname, output: Pathname).void }
  def self.main(root, output)
    template = File.read("templates/main.mustache")

    data = File.open(root / "tweets.js") do |f|
      raw = T.must(f.read).gsub("window.YTD.tweets.part0 = ", "")
      JSON.load(raw)
    end

    tweets = data
      .map do |t|
        next if t.dig("tweet", "full_text")&.start_with?("RT ")
        tweet_data(root, t)
      end
      .compact
      .sort_by(&:time)
      .reverse

    # puts tweets
    FileUtils.mkdir_p(output)
    File.open(output / "index.html", "w") do |index|
      index.write(Mustache.render(template, {tweets: tweets}))
    end
  end

  sig { params(root: Pathname, tweet_id: String, variants: T::Array[T.untyped]).returns(T.nilable(Video)) }
  def self.find_video(root, tweet_id, variants)
    variants.each do |variant|
      type = variant["content_type"]
      fragment, _ = variant["url"].split("/").last.split("?")
      path = root / "tweets_media" / "#{tweet_id}-#{fragment}"
      if path.exist?
        return Video.new(
          type: type,
          path: path
        )
      end
    end

    return nil
  end

  sig { params(root: Pathname, tweet: T.untyped).returns(T.nilable(Tweet)) }
  def self.tweet_data(root, tweet)
    tweet = tweet["tweet"]
    tweet_id = tweet["id"]

    tweet_text = +tweet["full_text"]

    replacements = T::Array[[Integer, Integer, String]].new

    tweet.dig("entities", "media")&.each do |media|
      from, to = media["indices"].map(&:to_i)
      replacements << [from, to, ""]
    end

    # stitch the URLs back into the tweet text
    tweet.dig("entities", "urls")&.each do |url|
      from, to = url["indices"].map(&:to_i)
      href = url["expanded_url"]
      disp = url["display_url"]
      replacements << [from, to, "<a href=\"#{href}\">#{disp}</a>"]
    end

    tweet.dig("entities", "user_mentions")&.each do |user|
      from, to = user["indices"].map(&:to_i)
      name = user["screen_name"]
      link = "<a href=\"https://twitter.com/#{name}\">@#{name}</a>"
      replacements << [from, to, link]
    end

    tweet.dig("entities", "hashtags")&.each do |hashtag|
      from, to = hashtag["indices"].map(&:to_i)
      name = hashtag["text"]
      replacements << [from, to, "<span class=\"hashtag\">##{name}</span>"]
    end

    replacements.sort_by(&:first).reverse.each do |from, to, str|
      tweet_text[from...to] = str
    end

    media_objects = tweet.dig("extended_entities", "media")&.map do |m|
      if m["type"] == "video"
        v = find_video(root, tweet_id, m.dig("video_info", "variants"))
        return nil if v.nil?
        v
      else
        filename = m["media_url"].split("/").last
        Image.new(
          path: root / "tweets_media" / "#{tweet_id}-#{filename}"
        )
      end
    end

    Tweet.new(
      tweet_id: tweet_id,
      reply: !tweet.dig("entities", "user_mentions")&.empty?,
      text: tweet_text,
      time: Time.parse(tweet["created_at"]),
      media: media_objects
    )
  end
end

if File.expand_path($PROGRAM_NAME) == __FILE__
  if ARGV.size == 2
    Twote.main(Pathname.new(ARGV.first), Pathname.new(ARGV.fetch(1)))
  else
    puts("Usage: $PROGRAM_NAME [tweet.js] [output]")
    exit(1)
  end
end
