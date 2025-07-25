# typed: true
# frozen_string_literal: true

require "ruby_lsp/addon"
require "ruby_lsp/internal"

require_relative "code_lens"
require_relative "../cell/version"

RubyLsp::Addon.depend_on_ruby_lsp!("~> 0.26.0")

module RubyLsp
  module Cell
    # Addon for Ruby LSP Cell Context
    #
    class Addon < ::RubyLsp::Addon
      #: -> void
      def initialize
        super
        @global_state = nil #: RubyLsp::GlobalState?
        @message_queue = nil #: Thread::Queue?
        @settings = nil #: Hash[Symbol, untyped]?
        @enabled = nil #: bool?
        @default_view_filename = nil #: String?
      end

      # @override
      #: (RubyLsp::GlobalState global_state, Thread::Queue message_queue) -> void
      def activate(global_state, message_queue)
        return unless are_required_libraries_installed?

        @message_queue = message_queue
        @global_state = global_state
        @settings = @global_state.settings_for_addon(name) || {}
        @enabled = @settings.fetch(:enabled, true)
        @default_view_filename = @settings.fetch(:defaultViewFileName, "show.erb")
      end

      # @override
      #: -> void
      def deactivate; end

      # @override
      #: -> String
      def name
        "Ruby LSP Cell"
      end

      # @override
      #: (RubyLsp::ResponseBuilders::CollectionResponseBuilder[untyped] response_builder, URI::Generic uri, Prism::Dispatcher dispatcher) -> void
      def create_code_lens_listener(response_builder, uri, dispatcher)
        CodeLens.new(
          response_builder,
          uri,
          dispatcher,
          @global_state, #: as !nil
          enabled: @enabled, #: as !nil
          default_view_filename: @default_view_filename, #: as !nil
        )
      end

      # @override
      #: -> String
      def version
        RubyLsp::Cell::VERSION
      end

      def are_required_libraries_installed?
        Bundler.definition.specs.any? do |spec|
          spec.name == "cells"
        end
      rescue Bundler::GemNotFound
        false
      end
    end
  end
end
