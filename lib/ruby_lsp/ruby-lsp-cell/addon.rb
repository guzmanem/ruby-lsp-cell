# typed: false
# frozen_string_literal: true

require "ruby_lsp/addon"
require "ruby_lsp/internal"

require_relative "code_lens"
require_relative "../cell/version"

module RubyLsp
  module Cell
    #
    # Addon for Ruby LSP Cell Context
    #
    class Addon < ::RubyLsp::Addon
      extend T::Sig

      sig { void }
      def initialize
        super
        @global_state = T.let(nil, T.nilable(RubyLsp::GlobalState))
        @message_queue = T.let(nil, T.nilable(Thread::Queue))
        @settings = T.let(nil, T.nilable(T::Hash[String, T.untyped]))
        @enabled = T.let(nil, T.nilable(T::Boolean))
        @default_view_filename = T.let(nil, T.nilable(String))
      end

      sig { override.params(global_state: RubyLsp::GlobalState, message_queue: Thread::Queue).void }
      def activate(global_state, message_queue)
        @message_queue = message_queue
        @global_state = global_state
        @settings = @global_state.settings_for_addon(name) || {}
        @enabled = @settings.fetch(:enabled, true)
        @default_view_filename = @settings.fetch(:defaultViewFileName, "show.erb")
      end

      sig { override.void }
      def deactivate; end

      sig { override.returns(String) }
      def name
        "Ruby LSP Cell"
      end

      sig do
        override.params(
          response_builder: ResponseBuilders::CollectionResponseBuilder,
          uri: URI::Generic,
          dispatcher: Prism::Dispatcher,
        ).void
      end
      def create_code_lens_listener(response_builder, uri, dispatcher)
        CodeLens.new(
          response_builder,
          uri,
          dispatcher,
          T.must(@global_state),
          enabled: T.must(@enabled),
          default_view_filename: T.must(@default_view_filename),
        )
      end

      sig { override.returns(String) }
      def version
        RubyLsp::Cell::VERSION
      end
    end
  end
end
