# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/yard/all/yard.rbi
#
# yard-0.9.28

module YARD
  def self.load_plugins; end
  def self.parse(*args); end
  def self.parse_string(*args); end
  def self.ruby18?; end
  def self.ruby19?; end
  def self.ruby2?; end
  def self.ruby31?; end
  def self.ruby3?; end
  def self.windows?; end
end
module YARD::Server
  def self.register_static_path(path); end
end
class Object < BasicObject
  def P(namespace, name = nil, type = nil); end
  def log; end
end
module YARD::CLI
end
module YARD::CodeObjects
end
module YARD::Handlers
end
module YARD::Handlers::Common
end
module YARD::Handlers::C
end
module YARD::Handlers::Ruby
end
module YARD::Handlers::Ruby::Legacy
end
module YARD::I18n
end
module YARD::Parser
end
module YARD::Parser::C
end
module YARD::Parser::Ruby
  def s(*args); end
end
module YARD::Parser::Ruby::Legacy
end
module YARD::Rake
end
module YARD::Serializers
end
module YARD::Server::Commands
end
module YARD::Tags
end
module YARD::Templates
end
module YARD::Templates::Helpers
end
module YARD::Templates::Helpers::Markup
end
class YARD::Config
  def self.add_ignored_plugins_file; end
  def self.arguments; end
  def self.load; end
  def self.load_autoload_plugins; end
  def self.load_commandline_plugins; end
  def self.load_commandline_safemode; end
  def self.load_gem_plugins; end
  def self.load_plugin(name); end
  def self.load_plugin_failed(name, exception); end
  def self.load_plugins; end
  def self.options; end
  def self.options=(arg0); end
  def self.read_config_file; end
  def self.save; end
  def self.translate_plugin_name(name); end
  def self.translate_plugin_names; end
  def self.with_yardopts; end
end
class SymbolHash < Hash
  def [](key); end
  def []=(key, value); end
  def delete(key); end
  def has_key?(key); end
  def initialize(symbolize_value = nil); end
  def key?(key); end
  def merge!(hash); end
  def merge(hash); end
  def self.[](*hsh); end
  def update(hash); end
end
class File < IO
  def self.cleanpath(path, rel_root = nil); end
  def self.open!(file, *args, &block); end
  def self.read_binary(file); end
  def self.relative_path(from, to); end
end
class Insertion
  def after(val, recursive = nil); end
  def after_any(val); end
  def before(val, recursive = nil); end
  def before_any(val); end
  def initialize(list, value); end
  def insertion(val, rel, recursive = nil, list = nil); end
end
class Module
  def class_name; end
end
class String
  def shell_split; end
end
class Array
  def place(*values); end
end
module Gem
  def self.source_index; end
end
class Gem::SourceIndex
  def ==(other); end
  def add_spec(gem_spec, name = nil); end
  def add_specs(*gem_specs); end
  def all_gems; end
  def dump; end
  def each(&block); end
  def find_name(gem_name, requirement = nil); end
  def gem_signature(gem_full_name); end
  def gems; end
  def index_signature; end
  def initialize(specifications = nil); end
  def latest_specs(include_prerelease = nil); end
  def length; end
  def load_gems_in(*spec_dirs); end
  def outdated; end
  def prerelease_gems; end
  def prerelease_specs; end
  def refresh!; end
  def released_gems; end
  def released_specs; end
  def remove_spec(full_name); end
  def search(gem_pattern, platform_only = nil); end
  def self.from_gems_in(*spec_dirs); end
  def self.from_installed_gems(*deprecated); end
  def self.installed_spec_directories; end
  def self.load_specification(file_name); end
  def size; end
  def spec_dirs; end
  def spec_dirs=(arg0); end
  def specification(full_name); end
  include Enumerable
end
class YARD::Options
  def ==(other); end
  def [](key); end
  def []=(key, value); end
  def delete(key); end
  def each; end
  def inspect; end
  def merge(opts); end
  def method_missing(meth, *args, &block); end
  def reset_defaults; end
  def self.default_attr(key, default); end
  def to_hash; end
  def update(opts); end
end
class YARD::Templates::TemplateOptions < YARD::Options
  def __globals; end
  def default_return; end
  def default_return=(arg0); end
  def embed_mixins; end
  def embed_mixins=(arg0); end
  def embed_mixins_match?(mixin); end
  def format; end
  def format=(arg0); end
  def globals; end
  def globals=(arg0); end
  def hide_void_return; end
  def hide_void_return=(arg0); end
  def highlight; end
  def highlight=(arg0); end
  def index; end
  def index=(arg0); end
  def markup; end
  def markup=(arg0); end
  def markup_provider; end
  def markup_provider=(arg0); end
  def no_highlight; end
  def no_highlight=(value); end
  def object; end
  def object=(arg0); end
  def owner; end
  def owner=(arg0); end
  def page_title; end
  def page_title=(arg0); end
  def serialize; end
  def serialize=(arg0); end
  def serializer; end
  def serializer=(arg0); end
  def template; end
  def template=(arg0); end
  def type; end
  def type=(arg0); end
  def verifier; end
  def verifier=(arg0); end
end
class YARD::CLI::Command
  def common_options(opts); end
  def description; end
  def load_script(file); end
  def parse_options(opts, args); end
  def self.run(*args); end
  def unrecognized_option(err); end
end
class YARD::CLI::YardoptsCommand < YARD::CLI::Command
  def initialize; end
  def options_file; end
  def options_file=(arg0); end
  def parse_arguments(*args); end
  def parse_rdoc_document_file(file = nil); end
  def parse_yardopts(file = nil); end
  def parse_yardopts_options(*args); end
  def support_rdoc_document_file!(file = nil); end
  def use_document_file; end
  def use_document_file=(arg0); end
  def use_yardopts_file; end
  def use_yardopts_file=(arg0); end
  def yardopts(file = nil); end
  def yardopts_options(opts); end
end
class YARD::CLI::YardocOptions < YARD::Templates::TemplateOptions
  def file; end
  def file=(arg0); end
  def files; end
  def files=(arg0); end
  def format; end
  def format=(arg0); end
  def index; end
  def index=(arg0); end
  def item; end
  def item=(arg0); end
  def locale; end
  def locale=(arg0); end
  def objects; end
  def objects=(arg0); end
  def onefile; end
  def onefile=(arg0); end
  def readme; end
  def readme=(arg0); end
  def serializer; end
  def serializer=(arg0); end
  def title; end
  def title=(arg0); end
  def verifier; end
  def verifier=(arg0); end
end
class YARD::CLI::Yardoc < YARD::CLI::YardoptsCommand
  def add_api_verifier; end
  def add_extra_files(*files); end
  def add_tag(tag_data, factory_method = nil); end
  def add_visibility_verifier; end
  def all_objects; end
  def apis; end
  def apis=(arg0); end
  def apply_locale; end
  def assets; end
  def assets=(arg0); end
  def copy_assets; end
  def description; end
  def excluded; end
  def excluded=(arg0); end
  def extra_file_valid?(file, check_exists = nil); end
  def fail_on_warning; end
  def fail_on_warning=(arg0); end
  def files; end
  def files=(arg0); end
  def general_options(opts); end
  def generate; end
  def generate=(arg0); end
  def has_markup; end
  def has_markup=(arg0); end
  def hidden_apis; end
  def hidden_apis=(arg0); end
  def hidden_tags; end
  def hidden_tags=(arg0); end
  def initialize; end
  def list; end
  def list=(arg0); end
  def options; end
  def optparse(*args); end
  def output_options(opts); end
  def parse_arguments(*args); end
  def parse_files(*files); end
  def print_list; end
  def run(*args); end
  def run_generate(checksums); end
  def run_verifier(list); end
  def save_yardoc; end
  def save_yardoc=(arg0); end
  def statistics; end
  def statistics=(arg0); end
  def tag_options(opts); end
  def use_cache; end
  def use_cache=(arg0); end
  def verify_markup_options; end
  def visibilities; end
  def visibilities=(arg0); end
end
class YARD::Parser::Base
  def enumerator; end
  def initialize(source, filename); end
  def parse; end
  def self.parse(source, filename = nil); end
  def tokenize; end
end
class YARD::Parser::Ruby::AstNode < Array
  def ==(other); end
  def block?; end
  def call?; end
  def children; end
  def comments; end
  def comments_hash_flag; end
  def comments_range; end
  def condition?; end
  def def?; end
  def docstring; end
  def docstring=(arg0); end
  def docstring_hash_flag; end
  def docstring_hash_flag=(arg0); end
  def docstring_range; end
  def docstring_range=(arg0); end
  def file; end
  def file=(arg0); end
  def first_line; end
  def full_source; end
  def full_source=(arg0); end
  def group; end
  def group=(arg0); end
  def has_line?; end
  def initialize(type, arr, opts = nil); end
  def inspect; end
  def jump(*node_types); end
  def kw?; end
  def line; end
  def line_range; end
  def line_range=(arg0); end
  def literal?; end
  def loop?; end
  def parent; end
  def parent=(arg0); end
  def pretty_print(q); end
  def ref?; end
  def reset_line_info; end
  def self.node_class_for(type); end
  def show; end
  def source; end
  def source=(arg0); end
  def source_range; end
  def source_range=(arg0); end
  def to_s; end
  def token?; end
  def traverse; end
  def type; end
  def type=(arg0); end
  def unfreeze; end
end
class YARD::Parser::Ruby::ReferenceNode < YARD::Parser::Ruby::AstNode
  def namespace; end
  def path; end
  def ref?; end
end
class YARD::Parser::Ruby::LiteralNode < YARD::Parser::Ruby::AstNode
  def literal?; end
end
class YARD::Parser::Ruby::KeywordNode < YARD::Parser::Ruby::AstNode
  def kw?; end
end
class YARD::Parser::Ruby::ParameterNode < YARD::Parser::Ruby::AstNode
  def args_forward; end
  def block_param; end
  def double_splat_param; end
  def named_params; end
  def splat_param; end
  def unnamed_end_params; end
  def unnamed_optional_params; end
  def unnamed_required_params; end
end
class YARD::Parser::Ruby::MethodCallNode < YARD::Parser::Ruby::AstNode
  def block; end
  def block_param; end
  def call?; end
  def call_has_paren?; end
  def index_adjust; end
  def method_name(name_only = nil); end
  def namespace; end
  def parameters(include_block_param = nil); end
end
class YARD::Parser::Ruby::MethodDefinitionNode < YARD::Parser::Ruby::AstNode
  def block(*arg0); end
  def def?; end
  def index_adjust; end
  def kw?; end
  def method_name(name_only = nil); end
  def namespace; end
  def parameters(include_block_param = nil); end
  def signature; end
end
class YARD::Parser::Ruby::ConditionalNode < YARD::Parser::Ruby::KeywordNode
  def cmod?; end
  def condition; end
  def condition?; end
  def else_block; end
  def then_block; end
end
class YARD::Parser::Ruby::ClassNode < YARD::Parser::Ruby::KeywordNode
  def block; end
  def class_name; end
  def superclass; end
end
class YARD::Parser::Ruby::ModuleNode < YARD::Parser::Ruby::KeywordNode
  def block; end
  def module_name; end
end
class YARD::Parser::Ruby::LoopNode < YARD::Parser::Ruby::KeywordNode
  def block; end
  def condition; end
  def loop?; end
end
class YARD::Parser::Ruby::CommentNode < YARD::Parser::Ruby::AstNode
  def comments; end
  def docstring; end
  def docstring=(value); end
  def first_line; end
  def source; end
end
class YARD::Parser::Ruby::RubyParser < YARD::Parser::Base
  def encoding_line; end
  def enumerator; end
  def frozen_string_line; end
  def initialize(source, filename); end
  def parse; end
  def shebang_line; end
  def tokenize; end
end
class YARD::Parser::Ruby::RipperParser < Ripper
  def add_comment(line, node = nil, before_node = nil, into = nil); end
  def add_token(token, data); end
  def ast; end
  def charno; end
  def comment_starts_line?(charno); end
  def comments; end
  def compile_error(msg); end
  def encoding_line; end
  def enumerator; end
  def file; end
  def file_encoding; end
  def freeze_tree(node = nil); end
  def frozen_string_line; end
  def initialize(source, filename, *args); end
  def insert_comments; end
  def on_BEGIN(*args); end
  def on_CHAR(tok); end
  def on_END(*args); end
  def on___end__(tok); end
  def on_alias(*args); end
  def on_alias_error(*args); end
  def on_aref(*args); end
  def on_aref_field(*args); end
  def on_arg_ambiguous(*args); end
  def on_arg_paren(*args); end
  def on_args_add(list, item); end
  def on_args_add_block(list, item); end
  def on_args_add_star(list, item); end
  def on_args_new(*args); end
  def on_array(other); end
  def on_assign(*args); end
  def on_assign_error(*args); end
  def on_assoc_new(*args); end
  def on_assoc_splat(*args); end
  def on_assoclist_from_args(*args); end
  def on_backref(tok); end
  def on_backtick(tok); end
  def on_bare_assoc_hash(*args); end
  def on_begin(*args); end
  def on_binary(*args); end
  def on_block_var(*args); end
  def on_blockarg(*args); end
  def on_body_stmt(*args); end
  def on_bodystmt(*args); end
  def on_brace_block(*args); end
  def on_break(*args); end
  def on_call(*args); end
  def on_case(*args); end
  def on_class(*args); end
  def on_class_name_error(*args); end
  def on_comma(tok); end
  def on_command(*args); end
  def on_command_call(*args); end
  def on_comment(comment); end
  def on_const(tok); end
  def on_const_path_field(*args); end
  def on_const_path_ref(*args); end
  def on_const_ref(*args); end
  def on_cvar(tok); end
  def on_def(*args); end
  def on_defined(*args); end
  def on_defs(*args); end
  def on_do_block(*args); end
  def on_dot2(*args); end
  def on_dot3(*args); end
  def on_dyna_symbol(sym); end
  def on_else(*args); end
  def on_elsif(*args); end
  def on_embdoc(text); end
  def on_embdoc_beg(text); end
  def on_embdoc_end(text); end
  def on_embexpr_beg(tok); end
  def on_embexpr_end(tok); end
  def on_embvar(tok); end
  def on_ensure(*args); end
  def on_excessed_comma(*args); end
  def on_fcall(*args); end
  def on_field(*args); end
  def on_float(tok); end
  def on_for(*args); end
  def on_gvar(tok); end
  def on_hash(*args); end
  def on_heredoc_beg(tok); end
  def on_heredoc_dedent(*args); end
  def on_heredoc_end(tok); end
  def on_ident(tok); end
  def on_if(*args); end
  def on_if_mod(*args); end
  def on_ifop(*args); end
  def on_ignored_nl(tok); end
  def on_ignored_sp(tok); end
  def on_imaginary(tok); end
  def on_int(tok); end
  def on_ivar(tok); end
  def on_kw(tok); end
  def on_kwrest_param(*args); end
  def on_label(data); end
  def on_label_end(tok); end
  def on_lambda(*args); end
  def on_lbrace(tok); end
  def on_lbracket(tok); end
  def on_lparen(tok); end
  def on_magic_comment(*args); end
  def on_massign(*args); end
  def on_method_add_arg(list, item); end
  def on_method_add_block(list, item); end
  def on_mlhs_add(list, item); end
  def on_mlhs_add_post(list, item); end
  def on_mlhs_add_star(list, item); end
  def on_mlhs_new(*args); end
  def on_mlhs_paren(*args); end
  def on_module(*args); end
  def on_mrhs_add(list, item); end
  def on_mrhs_add_star(list, item); end
  def on_mrhs_new(*args); end
  def on_mrhs_new_from_args(*args); end
  def on_next(*args); end
  def on_nl(tok); end
  def on_op(tok); end
  def on_opassign(*args); end
  def on_operator_ambiguous(*args); end
  def on_param_error(*args); end
  def on_params(*args); end
  def on_paren(*args); end
  def on_parse_error(msg); end
  def on_period(tok); end
  def on_program(*args); end
  def on_qsymbols_add(list, item); end
  def on_qsymbols_beg(tok); end
  def on_qsymbols_new(*args); end
  def on_qwords_add(list, item); end
  def on_qwords_beg(tok); end
  def on_qwords_new(*args); end
  def on_rational(tok); end
  def on_rbrace(tok); end
  def on_rbracket(tok); end
  def on_redo(*args); end
  def on_regexp_add(list, item); end
  def on_regexp_beg(tok); end
  def on_regexp_end(tok); end
  def on_regexp_literal(*args); end
  def on_regexp_new(*args); end
  def on_rescue(exc, *args); end
  def on_rescue_mod(*args); end
  def on_rest_param(*args); end
  def on_retry(*args); end
  def on_return(*args); end
  def on_return0(*args); end
  def on_rparen(tok); end
  def on_sclass(*args); end
  def on_semicolon(tok); end
  def on_sp(tok); end
  def on_stmts_add(list, item); end
  def on_stmts_new(*args); end
  def on_string_add(list, item); end
  def on_string_concat(*args); end
  def on_string_content(*args); end
  def on_string_dvar(*args); end
  def on_string_embexpr(*args); end
  def on_string_literal(*args); end
  def on_super(*args); end
  def on_symbeg(tok); end
  def on_symbol(*args); end
  def on_symbol_literal(*args); end
  def on_symbols_add(list, item); end
  def on_symbols_beg(tok); end
  def on_symbols_new(*args); end
  def on_tlambda(tok); end
  def on_tlambeg(tok); end
  def on_top_const_field(*args); end
  def on_top_const_ref(*args); end
  def on_tstring_beg(tok); end
  def on_tstring_content(tok); end
  def on_tstring_end(tok); end
  def on_unary(op, val); end
  def on_undef(*args); end
  def on_unless(*args); end
  def on_unless_mod(*args); end
  def on_until(*args); end
  def on_until_mod(*args); end
  def on_var_alias(*args); end
  def on_var_field(*args); end
  def on_var_ref(*args); end
  def on_vcall(*args); end
  def on_void_stmt; end
  def on_when(*args); end
  def on_while(*args); end
  def on_while_mod(*args); end
  def on_word_add(list, item); end
  def on_word_new(*args); end
  def on_words_add(list, item); end
  def on_words_beg(tok); end
  def on_words_new(*args); end
  def on_words_sep(tok); end
  def on_xstring_add(list, item); end
  def on_xstring_literal(*args); end
  def on_xstring_new(*args); end
  def on_yield(*args); end
  def on_yield0(*args); end
  def on_zsuper(*args); end
  def parse; end
  def root; end
  def shebang_line; end
  def tokens; end
  def visit_event(node); end
  def visit_event_arr(node); end
  def visit_ns_token(token, data, ast_token = nil); end
end
class YARD::Parser::Ruby::Legacy::RubyParser < YARD::Parser::Base
  def encoding_line; end
  def enumerator; end
  def initialize(source, _filename); end
  def parse; end
  def shebang_line; end
  def tokenize; end
end
class YARD::Parser::C::CParser < YARD::Parser::Base
  def advance(num = nil); end
  def advance_loop; end
  def attach_comment(statement); end
  def back(num = nil); end
  def char(num = nil); end
  def consume_body_statements; end
  def consume_comment(add_comment = nil); end
  def consume_directive; end
  def consume_quote(type = nil); end
  def consume_toplevel_statement; end
  def consume_until(end_char, bracket_level = nil, brace_level = nil, add_comment = nil); end
  def consume_whitespace; end
  def enumerator; end
  def initialize(source, file = nil); end
  def nextchar(num = nil); end
  def nextline; end
  def parse; end
  def parse_toplevel; end
  def prevchar(num = nil); end
  def strip_non_statement_data; end
  def struct; end
  def tokenize; end
end
class YARD::Parser::UndocumentableError < RuntimeError
end
class YARD::Parser::ParserSyntaxError < YARD::Parser::UndocumentableError
end
class YARD::Parser::OrderedParser
  def files; end
  def files=(arg0); end
  def initialize(global_state, files); end
  def parse; end
end
class YARD::Parser::SourceParser
  def contents; end
  def convert_encoding(content); end
  def file; end
  def file=(arg0); end
  def globals; end
  def initialize(parser_type = nil, globals1 = nil, globals2 = nil); end
  def parse(content = nil); end
  def parser_class; end
  def parser_type; end
  def parser_type=(value); end
  def parser_type_for_filename(filename); end
  def post_process; end
  def self.after_parse_file(&block); end
  def self.after_parse_file_callbacks; end
  def self.after_parse_list(&block); end
  def self.after_parse_list_callbacks; end
  def self.before_parse_file(&block); end
  def self.before_parse_file_callbacks; end
  def self.before_parse_list(&block); end
  def self.before_parse_list_callbacks; end
  def self.parse(paths = nil, excluded = nil, level = nil); end
  def self.parse_in_order(*files); end
  def self.parse_string(content, ptype = nil); end
  def self.parser_type; end
  def self.parser_type=(value); end
  def self.parser_type_extensions; end
  def self.parser_type_extensions=(value); end
  def self.parser_type_for_extension(extension); end
  def self.parser_types; end
  def self.parser_types=(value); end
  def self.register_parser_type(type, parser_klass, extensions = nil); end
  def self.tokenize(content, ptype = nil); end
  def self.validated_parser_type(type); end
  def tokenize(content); end
end
class YARD::Handlers::HandlerAborted < RuntimeError
end
class YARD::Handlers::NamespaceMissingError < YARD::Parser::UndocumentableError
  def initialize(object); end
  def object; end
  def object=(arg0); end
end
class YARD::Handlers::Base
  def abort!; end
  def call_params; end
  def caller_method; end
  def ensure_loaded!(object, max_retries = nil); end
  def extra_state; end
  def globals; end
  def initialize(source_parser, stmt); end
  def namespace; end
  def namespace=(v); end
  def owner; end
  def owner=(v); end
  def parse_block(*arg0); end
  def parser; end
  def process; end
  def push_state(opts = nil); end
  def register(*objects); end
  def register_docstring(object, docstring = nil, stmt = nil); end
  def register_dynamic(object); end
  def register_ensure_loaded(object); end
  def register_file_info(object, file = nil, line = nil, comments = nil); end
  def register_group(object, group = nil); end
  def register_module_function(object); end
  def register_source(object, source = nil, type = nil); end
  def register_transitive_tags(object); end
  def register_visibility(object, visibility = nil); end
  def scope; end
  def scope=(v); end
  def self.clear_subclasses; end
  def self.handlers; end
  def self.handles(*matches); end
  def self.handles?(statement); end
  def self.in_file(filename); end
  def self.inherited(subclass); end
  def self.matches_file?(filename); end
  def self.namespace_only; end
  def self.namespace_only?; end
  def self.process(&block); end
  def self.subclasses; end
  def statement; end
  def visibility; end
  def visibility=(v); end
  include YARD::CodeObjects
  include YARD::Parser
end
class YARD::Handlers::Ruby::HandlesExtension
  def initialize(name); end
  def matches?(node); end
  def name; end
end
class YARD::Handlers::Ruby::MethodCallWrapper < YARD::Handlers::Ruby::HandlesExtension
  def matches?(node); end
end
class YARD::Handlers::Ruby::TestNodeWrapper < YARD::Handlers::Ruby::HandlesExtension
  def matches?(node); end
end
class YARD::Handlers::Ruby::Base < YARD::Handlers::Base
  def call_params; end
  def caller_method; end
  def parse_block(inner_node, opts = nil); end
  def self.handles?(node); end
  def self.meta_type(type); end
  def self.method_call(name = nil); end
  include YARD::Parser::Ruby
end
module YARD::Handlers::Ruby::StructHandlerMethods
  def add_reader_tags(klass, new_method, member); end
  def add_writer_tags(klass, new_method, member); end
  def create_attributes(klass, members); end
  def create_class(classname, superclass); end
  def create_member_method?(klass, member, type = nil); end
  def create_reader(klass, member); end
  def create_writer(klass, member); end
  def member_tag_for_member(klass, member, type = nil); end
  def members_from_tags(klass); end
  def return_type_from_tag(member_tag); end
  include YARD::CodeObjects
end
class YARD::Handlers::Ruby::ClassHandler < YARD::Handlers::Ruby::Base
  def create_struct_superclass(superclass, superclass_def); end
  def extract_parameters(superclass); end
  def parse_struct_superclass(klass, superclass); end
  def parse_superclass(superclass); end
  def struct_superclass_name(superclass); end
  include Anonymous_Module_3
  include YARD::Handlers::Ruby::StructHandlerMethods
end
module Anonymous_Module_3
  def process; end
end
