# typed: false
# frozen_string_literal: true

module RubyLsp
  module Cell
    class CodeLens
      include ::RubyLsp::Requests::Support::Common

      #: (
      #|  RubyLsp::ResponseBuilders::CollectionResponseBuilder[untyped] response_builder,
      #|  URI::Generic uri,
      #|  Prism::Dispatcher dispatcher,
      #|  RubyLsp::GlobalState global_state,
      #|  enabled: bool,
      #|  default_view_filename: String
      #| ) -> void
      def initialize(response_builder, uri, dispatcher, global_state, enabled:, default_view_filename:)
        return unless enabled

        @response_builder = response_builder
        @global_state = global_state

        @path = uri.to_standardized_path #: String
        @class_name = ""
        @pattern = "_cell"
        @default_view_filename = default_view_filename
        @in_cell_class = false
        @nesting = [] #: Array[String]
        dispatcher.register(
          self,
          :on_module_node_enter,
          :on_module_node_leave,
          :on_class_node_enter,
          :on_class_node_leave,
          :on_def_node_enter,
        )
      end

      #: (Prism::ModuleNode node) -> void
      def on_module_node_enter(node)
        @nesting.push(node.constant_path.slice)
      end

      #: (Prism::ModuleNode node) -> void
      def on_module_node_leave(node)
        @nesting.pop
      end

      #: (Prism::ClassNode node) -> void
      def on_class_node_enter(node)
        @nesting.push(node.constant_path.slice)
        class_name = @nesting.join("::")
        return unless class_name.end_with?("Cell")
        return unless @global_state.index.linearized_ancestors_of(class_name).include?("Cell::ViewModel")

        @in_cell_class = true
        add_default_goto_code_lens(node)
      end

      #: (Prism::ClassNode node) -> void
      def on_class_node_leave(node)
        @nesting.pop
        @in_cell_class = false
      end

      #: (Prism::DefNode node) -> void
      def on_def_node_enter(node)
        return unless @in_cell_class
        return unless contains_render_call?(node.body)

        add_function_goto_code_lens(node, node.name.to_s)
      end

      private

      #: (Prism::Node node) -> void
      def add_default_goto_code_lens(node)
        erb_filename = remove_last_pattern_in_string @default_view_filename, ".erb"
        uri = compute_erb_view_path @default_view_filename

        create_go_to_file_code_lens(node, erb_filename, uri)
      end

      #: (Prism::Node? node) -> bool
      def contains_render_call?(node)
        return false if node.nil?

        if node.is_a?(Prism::CallNode)
          return true if node.receiver.nil? && node.name == :render
        end

        node.child_nodes.any? { |child| contains_render_call?(child) }
      end

      #: (Prism::Node node, String name) -> void
      def add_function_goto_code_lens(node, name)
        uri = compute_erb_view_path("#{name}.erb")
        create_go_to_file_code_lens(node, name, uri)
      end

      #: (String string, String pattern) -> String
      def remove_last_pattern_in_string(string, pattern)
        string.sub(/#{pattern}$/, "")
      end

      #: (String name) -> String
      def compute_erb_view_path(name)
        escaped_pattern = Regexp.escape(@pattern)
        base_path = @path.sub(/#{escaped_pattern}\.rb$/, "")
        folder = File.basename(base_path)
        path = File.join(File.dirname(base_path), folder, name)
        uri = URI::File.from_path(path: path).to_s
        uri
      end

      #: (Prism::Node node, String name, String uri) -> void
      def create_go_to_file_code_lens(node, name, uri)
        @response_builder << create_code_lens(
          node,
          title: "Go to #{name}",
          command_name: "rubyLsp.openFile",
          arguments: [[uri]],
          data: { type: "file" },
        )
      end
    end
  end
end
