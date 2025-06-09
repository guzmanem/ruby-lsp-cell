# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_lsp/cell/version"

Gem::Specification.new do |spec|
  spec.name = "ruby-lsp-cell"
  spec.version = RubyLsp::Cell::VERSION
  spec.authors = ["Edgar Guzmán"]
  spec.email = ["guzmanem@hotmail.com"]

  spec.summary = "Ruby LSP addon for cell-based development support"
  spec.description = "A Ruby LSP extension that provides additional language server features for cell-based development workflows"
  spec.homepage = "https://github.com/guzmanem/ruby-lsp-cell"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/guzmanem/ruby-lsp-cell"
  spec.metadata["changelog_uri"] = "https://github.com/guzmanem/ruby-lsp-cell/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(__dir__) do
    %x(git ls-files -z).split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(
          "bin/",
          "test/",
          "spec/",
          "features/",
          "examples/",
          ".git",
          ".circleci",
          "rubocop.yml",
          "appveyor",
          "Gemfile",
          "misc/",
          "sorbet/",
        )
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency("ruby-lsp", "~> 0.17.17", ">= 0.17.17")
end
