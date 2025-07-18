# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/trailblazer-option/all/trailblazer-option.rbi
#
# trailblazer-option-0.1.2

module Trailblazer
  def self.Option(value); end
end
class Trailblazer::Option
  def self.build(value); end
  def self.call!(value, *args, signal: nil, keyword_arguments: nil, **, &block); end
  def self.evaluate_callable(value, *args, **options, &block); end
  def self.evaluate_method(value, *args, exec_context: nil, **options, &block); end
  def self.evaluate_proc(value, *args, signal: nil, exec_context: nil, **options); end
end
