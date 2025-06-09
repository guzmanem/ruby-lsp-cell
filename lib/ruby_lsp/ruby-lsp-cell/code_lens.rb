# typed: false
# frozen_string_literal: true

module RubyLsp
  module Cell
    class CodeLens
      extend T::Sig
      extend T::Generic

      include ::RubyLsp::Requests::Support::Common

      REQUIRED_LIBRARY = T.let("cells-rails", String)

      ResponseType = type_member { { fixed: T::Array[CodeRay] } }

      sig do
        params(
          response_builder: RubyLsp::ResponseBuilders::CollectionResponseBuilder,
          uri: URI::Generic,
          dispatcher: Prism::Dispatcher,
          global_state: RubyLsp::GlobalState,
          enabled: T::Boolean,
          default_view_filename: String,
        ).void
      end
      def initialize(response_builder, uri, dispatcher, global_state, enabled:, default_view_filename:)
        return unless enabled

        @response_builder = response_builder
        @global_state = global_state

        @path = T.let(uri.to_standardized_path, String)
        @class_name = T.let("", String)
        @pattern = T.let("_cell", String)
        @default_view_filename = T.let(default_view_filename, String)
        dispatcher.register(self, :on_class_node_enter, :on_def_node_leave)
      end

      sig { params(node: Prism::ClassNode).void }
      def on_class_node_enter(node)
        @class_name = node.constant_path.slice
        return unless @class_name.end_with?("Cell")

        add_default_goto_code_lens(node)
      end

      sig { params(node: Prism::ClassNode).void }
      def on_class_node_leave(node)
        @class_name = ""
      end

      sig { params(node: Prism::DefNode).void }
      def on_def_node_leave(node)
        return unless @class_name.end_with?("Cell")
        return unless contains_render_call?(node.body)

        add_function_goto_code_lens(node, node.name.to_s)
      end

      private

      sig { params(node: Prism::Node).void }
      def add_default_goto_code_lens(node)
        return unless are_required_libraries_installed?

        erb_filename = remove_last_pattern_in_string @default_view_filename, ".erb"
        uri = compute_erb_view_path @default_view_filename

        @response_builder << create_code_lens(
          node,
          title: "Go to #{erb_filename}",
          command_name: "vscode.open",
          arguments: [uri],
          data: { type: "goToFile" },
        )
      end

      sig { params(node: T.nilable(Prism::Node)).returns(T::Boolean) }
      def contains_render_call?(node)
        return false if node.nil?

        return true if node.is_a?(Prism::CallNode) &&
          node.receiver.nil? &&
          node.message == "render"

        node.child_nodes.any? { |child| contains_render_call?(child) }
      end

      sig { params(node: Prism::Node, name: String).void }
      def add_function_goto_code_lens(node, name)
        return unless are_required_libraries_installed?

        uri = compute_erb_view_path("#{name}.erb")

        @response_builder << create_code_lens(
          node,
          title: "Go to #{name}",
          command_name: "vscode.open",
          arguments: [uri],
          data: { type: "goToFile" },
        )
      end

      sig { params(string: String, pattern: String).returns(String) }
      def remove_last_pattern_in_string(string, pattern)
        string.sub(/#{pattern}$/, "")
      end

      sig { params(name: String).returns(String) }
      def compute_erb_view_path(name)
        escaped_pattern = Regexp.escape(@pattern)
        base_path = @path.sub(/#{escaped_pattern}\.rb$/, "")
        folder = File.basename(base_path)
        File.join(File.dirname(base_path), folder, name)
      end

      sig { returns(T::Boolean) }
      def are_required_libraries_installed?
        Bundler.locked_gems.dependencies.keys.include?(REQUIRED_LIBRARY)
      end
    end
  end
end
