# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/tilt/all/tilt.rbi
#
# tilt-2.6.0

module Tilt
  def self.[](file); end
  def self.default_mapping; end
  def self.extract_fixed_locals; end
  def self.extract_fixed_locals=(arg0); end
  def self.finalize!; end
  def self.lazy_map; end
  def self.new(file, line = nil, options = nil, &block); end
  def self.prefer(template_class, *extensions); end
  def self.register(template_class, *extensions); end
  def self.register_lazy(class_name, file, *extensions); end
  def self.register_pipeline(ext, options = nil); end
  def self.registered?(ext); end
  def self.template_for(file); end
  def self.templates_for(file); end
end
module Tilt::CompiledTemplates
end
class Tilt::Template
  def _dup_string_if_frozen(string); end
  def basename(suffix = nil); end
  def binary(string); end
  def bind_compiled_method(method_source, offset, scope_class); end
  def compile_template_method(local_keys, scope_class = nil); end
  def compiled_method(locals_keys, scope_class = nil); end
  def compiled_path; end
  def compiled_path=(path); end
  def data; end
  def default_encoding; end
  def eval_compiled_method(method_source, offset, scope_class); end
  def eval_file; end
  def evaluate(scope, locals, &block); end
  def evaluate_method(method, scope, locals, &block); end
  def extract_encoding(script, &block); end
  def extract_fixed_locals; end
  def extract_magic_comment(script); end
  def file; end
  def fixed_locals?; end
  def freeze_string_literals?; end
  def initialize(file = nil, line = nil, options = nil); end
  def line; end
  def load_compiled_method(path, method_source); end
  def local_extraction(local_keys); end
  def metadata; end
  def name; end
  def options; end
  def precompiled(local_keys); end
  def precompiled_postamble(local_keys); end
  def precompiled_preamble(local_keys); end
  def precompiled_template(local_keys); end
  def prepare; end
  def process_arg(arg); end
  def read_template_file; end
  def render(scope = nil, locals = nil, &block); end
  def self.default_mime_type; end
  def self.default_mime_type=(value); end
  def self.metadata; end
  def set_compiled_method_cache; end
  def set_fixed_locals; end
  def skip_compiled_encoding_detection?; end
  def unbind_compiled_method(method_name); end
end
class Tilt::StaticTemplate < Tilt::Template
  def allows_script?; end
  def compiled_method(locals_keys, scope_class = nil); end
  def prepare; end
  def render(scope = nil, locals = nil); end
  def self.subclass(mime_type: nil, &block); end
  def set_compiled_method_cache; end
  def set_fixed_locals; end
end
class Tilt::Pipeline < Tilt::Template
  def evaluate(scope, locals, &block); end
  def prepare; end
end
class Tilt::BaseMapping
  def [](file); end
  def new(file, line = nil, options = nil, &block); end
  def split(file); end
  def template_for(file); end
  def templates_for(file); end
end
class Tilt::Mapping < Tilt::BaseMapping
  def constant_defined?(name); end
  def extensions_for(template_class); end
  def finalized; end
  def initialize; end
  def initialize_copy(other); end
  def lazy?(ext); end
  def lazy_load(pattern); end
  def lazy_map; end
  def lookup(ext); end
  def register(template_class, *extensions); end
  def register_defined_classes(class_names, pattern); end
  def register_lazy(class_name, file, *extensions); end
  def register_pipeline(ext, options = nil); end
  def registered?(ext); end
  def template_map; end
  def unregister(*extensions); end
end
class Tilt::FinalizedMapping < Tilt::BaseMapping
  def clone(freeze: nil); end
  def dup; end
  def extensions_for(template_class); end
  def initialize(template_map); end
  def lookup(ext); end
  def registered?(ext); end
end
class Tilt::Cache
  def clear; end
  def fetch(*key); end
  def initialize; end
end
