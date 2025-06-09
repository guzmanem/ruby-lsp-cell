# typed: strict
# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "sorbet-runtime"
require "ruby_lsp/test_helper"
require "ruby_lsp/internal"
require "ruby_lsp/cell"
require "uri"
require "byebug"

require "minitest/autorun"

$VERBOSE = nil
module Minitest
  class Test
    include RubyLsp::TestHelper

    Minitest::Test.make_my_diffs_pretty!
    if T::Configuration.respond_to?(:disable_checking, true)
      T::Configuration.disable_checking
    elsif T::Configuration.respond_to?(:default_checked, true)
      T::Configuration.default_checked(false)
    end
  end
end
