# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/builder/all/builder.rbi
#
# builder-3.3.0

module Builder
  def self.check_for_name_collision(klass, method_name, defined_constant = nil); end
end
module Builder::XChar
  def self.encode(string); end
  def self.unicode(string); end
end
class Builder::IllegalBlockError < RuntimeError
end
class Builder::XmlBase < BasicObject
  def <<(text); end
  def _escape(text); end
  def _escape_attribute(text); end
  def _indent; end
  def _nested_structures(block); end
  def _newline; end
  def cache_method_call(sym); end
  def explicit_nil_handling?; end
  def initialize(indent = nil, initial = nil, encoding = nil); end
  def method_missing(sym, *args, &block); end
  def nil?; end
  def self.cache_method_calls; end
  def self.cache_method_calls=(arg0); end
  def tag!(sym, *args, &block); end
  def text!(text); end
end
class Builder::XmlMarkup < Builder::XmlBase
  def _attr_value(value); end
  def _end_tag(sym); end
  def _ensure_no_block(got_block); end
  def _insert_attributes(attrs, order = nil); end
  def _special(open, close, data = nil, attrs = nil, order = nil); end
  def _start_tag(sym, attrs, end_too = nil); end
  def _text(text); end
  def cdata!(text); end
  def cdata_value!(open, text); end
  def comment!(comment_text); end
  def declare!(inst, *args, &block); end
  def initialize(options = nil); end
  def instruct!(directive_tag = nil, attrs = nil); end
  def target!; end
end
class Builder::XmlEvents < Builder::XmlMarkup
  def _end_tag(sym); end
  def _start_tag(sym, attrs, end_too = nil); end
  def text!(text); end
end
