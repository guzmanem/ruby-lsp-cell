# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/coderay/all/coderay.rbi
#
# coderay-1.1.3

module CodeRay
  def self.coderay_path(*path); end
  def self.encode(code, lang, format, options = nil); end
  def self.encode_file(filename, format, options = nil); end
  def self.encode_tokens(tokens, format, options = nil); end
  def self.encoder(format, options = nil); end
  def self.get_scanner_options(options); end
  def self.highlight(code, lang, options = nil, format = nil); end
  def self.highlight_file(filename, options = nil, format = nil); end
  def self.scan(code, lang, options = nil, &block); end
  def self.scan_file(filename, lang = nil, options = nil, &block); end
  def self.scanner(lang, options = nil, &block); end
end
module CodeRay::FileType
  def self.[](filename, read_shebang = nil); end
  def self.fetch(filename, default = nil, read_shebang = nil); end
  def self.type_from_shebang(filename); end
end
class CodeRay::FileType::UnknownFileType < Exception
end
class CodeRay::Tokens < Array
  def begin_group(kind); end
  def begin_line(kind); end
  def count; end
  def encode(encoder, options = nil); end
  def end_group(kind); end
  def end_line(kind); end
  def method_missing(meth, options = nil); end
  def scanner; end
  def scanner=(arg0); end
  def split_into_parts(*sizes); end
  def text_token(*arg0); end
  def to_s; end
  def tokens(*arg0); end
end
class CodeRay::TokensProxy
  def block; end
  def block=(arg0); end
  def each(*args, &blk); end
  def encode(encoder, options = nil); end
  def initialize(input, lang, options = nil, block = nil); end
  def input; end
  def input=(arg0); end
  def lang; end
  def lang=(arg0); end
  def method_missing(method, *args, &blk); end
  def options; end
  def options=(arg0); end
  def scanner; end
  def tokens; end
end
module CodeRay::PluginHost
  def [](id, *args, &blk); end
  def all_plugins; end
  def const_missing(const); end
  def default(id = nil); end
  def list; end
  def load(id, *args, &blk); end
  def load_all; end
  def load_plugin_map; end
  def make_plugin_hash; end
  def map(hash); end
  def path_to(plugin_id); end
  def plugin_hash; end
  def plugin_path(*args); end
  def register(plugin, id); end
  def self.extended(mod); end
  def validate_id(id); end
end
class CodeRay::PluginHost::PluginNotFound < LoadError
end
class CodeRay::PluginHost::HostNotFound < LoadError
end
module CodeRay::Plugin
  def aliases; end
  def plugin_host(host = nil); end
  def plugin_id; end
  def register_for(id); end
  def title(title = nil); end
end
module CodeRay::Scanners
  extend CodeRay::PluginHost
end
class CodeRay::Scanners::Scanner < StringScanner
  def binary_string; end
  def column(pos = nil); end
  def each(&block); end
  def file_extension; end
  def initialize(code = nil, options = nil); end
  def lang; end
  def line(pos = nil); end
  def raise_inspect(message, tokens, state = nil, ambit = nil, backtrace = nil); end
  def raise_inspect_arguments(message, tokens, state, ambit); end
  def reset; end
  def reset_instance; end
  def scan_rest; end
  def scan_tokens(tokens, options); end
  def scanner_state_info(state); end
  def self.encode_with_encoding(code, target_encoding); end
  def self.encoding(name = nil); end
  def self.file_extension(extension = nil); end
  def self.guess_encoding(s); end
  def self.lang; end
  def self.normalize(code); end
  def self.to_unix(code); end
  def set_string_from_source(source); end
  def set_tokens_from_options(options); end
  def setup; end
  def state; end
  def state=(arg0); end
  def string=(code); end
  def tokenize(source = nil, options = nil); end
  def tokens; end
  def tokens_last(tokens, n); end
  def tokens_size(tokens); end
  extend CodeRay::Plugin
  include Enumerable
end
class CodeRay::Scanners::Scanner::ScanError < StandardError
end
class CodeRay::WordList < Hash
  def add(words, value = nil); end
  def initialize(default = nil); end
end
class CodeRay::WordList::CaseIgnoring < CodeRay::WordList
  def [](key); end
  def []=(key, value); end
end
module CodeRay::Scanners::Java::BuiltinTypes
end
class CodeRay::Scanners::Java < CodeRay::Scanners::Scanner
  def scan_tokens(encoder, options); end
end
class CodeRay::Scanners::Ruby < CodeRay::Scanners::Scanner
  def interpreted_string_state; end
  def scan_tokens(encoder, options); end
  def setup; end
end
module CodeRay::Scanners::Ruby::Patterns
end
class Anonymous_Struct_1 < Struct
  def delim; end
  def delim=(_); end
  def heredoc; end
  def heredoc=(_); end
  def interpreted; end
  def interpreted=(_); end
  def next_state; end
  def next_state=(_); end
  def opening_paren; end
  def opening_paren=(_); end
  def paren_depth; end
  def paren_depth=(_); end
  def pattern; end
  def pattern=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.keyword_init?; end
  def self.members; end
  def self.new(*arg0); end
  def type; end
  def type=(_); end
end
class CodeRay::Scanners::Ruby::StringState < Anonymous_Struct_1
  def heredoc_pattern(delim, interpreted, indented); end
  def initialize(kind, interpreted, delim, heredoc = nil); end
  def self.simple_key_pattern(delim); end
end
module CodeRay::Encoders
  extend CodeRay::PluginHost
end
class CodeRay::Encoders::Encoder
  def <<(token); end
  def begin_group(kind); end
  def begin_line(kind); end
  def compile(tokens, options = nil); end
  def encode(code, lang, options = nil); end
  def encode_tokens(tokens, options = nil); end
  def end_group(kind); end
  def end_line(kind); end
  def file_extension; end
  def finish(options); end
  def get_output(options); end
  def highlight(code, lang, options = nil); end
  def initialize(options = nil); end
  def options; end
  def options=(arg0); end
  def output(data); end
  def scanner; end
  def scanner=(arg0); end
  def self.const_missing(sym); end
  def self.file_extension; end
  def setup(options); end
  def text_token(text, kind); end
  def token(content, kind); end
  def tokens(tokens, options = nil); end
  extend CodeRay::Plugin
end
class CodeRay::Encoders::HTML < CodeRay::Encoders::Encoder
  def begin_group(kind); end
  def begin_line(kind); end
  def break_lines(text, style); end
  def check_group_nesting(name, kind); end
  def check_options!(options); end
  def close_span; end
  def css; end
  def css_class_for_kinds(kinds); end
  def end_group(kind); end
  def end_line(kind); end
  def finish(options); end
  def make_span_for_kinds(method, hint); end
  def self.make_html_escape_hash; end
  def self.token_path_to_hint(hint, kinds); end
  def setup(options); end
  def style_for_kinds(kinds); end
  def text_token(text, kind); end
end
module CodeRay::Encoders::HTML::Output
  def apply_title!(title); end
  def css; end
  def css=(arg0); end
  def self.extended(o); end
  def self.make_stylesheet(css, in_tag = nil); end
  def self.page_template_for_css(css); end
  def stylesheet(in_tag = nil); end
  def wrap!(element, *args); end
  def wrap_in!(template); end
  def wrapped_in; end
  def wrapped_in=(arg0); end
  def wrapped_in?(element); end
end
class CodeRay::Encoders::HTML::Output::Template < String
  def apply(target, replacement); end
  def self.wrap!(str, template, target); end
end
class CodeRay::Encoders::HTML::CSS
  def get_style_for_css_classes(css_classes); end
  def initialize(style = nil); end
  def parse(stylesheet); end
  def self.load_stylesheet(style = nil); end
  def stylesheet; end
end
module CodeRay::Encoders::HTML::Numbering
  def self.number!(output, mode = nil, options = nil); end
end
module CodeRay::Styles
  extend CodeRay::PluginHost
end
class CodeRay::Styles::Style
  extend CodeRay::Plugin
end
class CodeRay::Duo
  def call(code, options = nil); end
  def encode(code, options = nil); end
  def encoder; end
  def format; end
  def format=(arg0); end
  def highlight(code, options = nil); end
  def initialize(lang = nil, format = nil, options = nil); end
  def lang; end
  def lang=(arg0); end
  def options; end
  def options=(arg0); end
  def scanner; end
  def self.[](*, **); end
end
class CodeRay::Encoders::Terminal < CodeRay::Encoders::Encoder
  def begin_group(kind); end
  def begin_line(kind); end
  def end_group(kind); end
  def end_line(kind); end
  def open_token(kind); end
  def setup(options); end
  def text_token(text, kind); end
end
