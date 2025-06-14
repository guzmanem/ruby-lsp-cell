# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `erbse` gem.
# Please instead update this file by running `bin/tapioca gem erbse`.


# source://erbse//lib/erbse/parser.rb#1
module Erbse; end

# source://erbse//lib/erbse.rb#5
class Erbse::BlockFilter < ::Temple::Filter
  # assign all code in the block to new local output buffer without outputting it.
  # handles <%@ do %>
  #
  # source://erbse//lib/erbse.rb#23
  def on_capture_block(code, content_ast); end

  # Highly inspired by https://github.com/slim-template/slim/blob/master/lib/slim/controls.rb#on_slim_output
  #
  # source://erbse//lib/erbse.rb#7
  def on_erb_block(code, content_ast); end
end

# source://erbse//lib/erbse.rb#32
class Erbse::Engine < ::Temple::Engine; end

# source://erbse//lib/erbse/parser.rb#2
class Erbse::Parser
  # Parsing patterns
  #
  # Blocks will be recognized when written:
  # <% ... do %> or <% ... do |...| %>
  #
  # @return [Parser] a new instance of Parser
  #
  # source://erbse//lib/erbse/parser.rb#14
  def initialize(*_arg0); end

  # source://erbse//lib/erbse/parser.rb#17
  def call(str); end
end

# source://erbse//lib/erbse/parser.rb#7
Erbse::Parser::BLOCK_EXEC = T.let(T.unsafe(nil), Regexp)

# BLOCK_EXPR     = /\s*((\s+|\))do|\{)(\s*\|[^|]*\|)?\s*\Z/
#
# source://erbse//lib/erbse/parser.rb#6
Erbse::Parser::BLOCK_EXPR = T.let(T.unsafe(nil), Regexp)

# ERB_EXPR = /(\n)|<%(=|\#)?(.*?)%>(\n)*/m # this is the desired pattern.
#
# source://erbse//lib/erbse/parser.rb#4
Erbse::Parser::ERB_EXPR = T.let(T.unsafe(nil), Regexp)
