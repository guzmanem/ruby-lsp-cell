# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `declarative-option` gem.
# Please instead update this file by running `bin/tapioca gem declarative-option`.


# source://declarative-option//lib/declarative/option.rb#1
module Declarative
  class << self
    # source://declarative-option//lib/declarative/option.rb#4
    def Option(value, options = T.unsafe(nil)); end

    # source://declarative-option//lib/declarative/options.rb#4
    def Options(options, config = T.unsafe(nil)); end
  end
end

# source://declarative-option//lib/declarative/option.rb#2
module Declarative::Callable; end

# source://declarative-option//lib/declarative/option.rb#8
class Declarative::Option
  # source://declarative-option//lib/declarative/option.rb#9
  def call(value, options = T.unsafe(nil)); end

  private

  # All methods below are considered public API and are meant to be overridden.
  #
  # @return [Boolean]
  #
  # source://declarative-option//lib/declarative/option.rb#19
  def callable?(value, options); end

  # source://declarative-option//lib/declarative/option.rb#32
  def lambda_for_callable(value, options); end

  # source://declarative-option//lib/declarative/option.rb#23
  def lambda_for_proc(value, options); end

  # source://declarative-option//lib/declarative/option.rb#36
  def lambda_for_static(value, options); end

  # source://declarative-option//lib/declarative/option.rb#28
  def lambda_for_symbol(value, options); end
end

# source://declarative-option//lib/declarative/options.rb#10
class Declarative::Options < ::Hash
  # Evaluates every element and returns a hash.  Accepts context and arbitrary arguments.
  #
  # source://declarative-option//lib/declarative/options.rb#12
  def call(context, *args); end
end
