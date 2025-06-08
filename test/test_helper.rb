# typed: strict
# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ruby_lsp/test_helper"
require "ruby_lsp/internal"
require "ruby_lsp/cell"
require "uri"
require "byebug"

require "minitest/autorun"

module Minitest
  class Test
    include RubyLsp::TestHelper

    Minitest::Test.make_my_diffs_pretty!
  end
end
