# Ruby::Lsp::Cell

ruby-lsp-cell is an **addon for [Ruby LSP][ruby-lsp]** that adds smart CodeLens
links and navigation helpers for projects that use **[ViewComponent::Cell][cells]**
or any other *Cell-based* view layer. Its goal is to make jumping between a *Cell* class and its ERB/Haml template.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-lsp-cell'
```

And then execute:

>  $ bundle install

Or install it yourself as:

>  $ gem install ruby-lsp-cell

## Usage

1. Enable the addon:

  Create (or edit) `.vscode/settings.json` in your project root:

   ```json
   {
     "rubyLsp.addonSettings": {
       "Ruby LSP Cell": {
         "enabled": true,
         "defaultViewFileName": "show.erb"
       }
     }
   }
   ```

2. Open a Cell file:

  When you open `app/cells/user_cell.rb` Ruby LSP Cell inserts a single **Go to template** CodeLens in two places:

  * **Top of the class** – lets you jump directly to the default template (`app/cells/user/show.erb` unless you changed `defaultViewFileName` in `.vscode/settings.json`).
  * **Any instance method that calls `render`** – jumps to the template rendered by that method.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To release a new version, update the version number in `version.rb`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/guzmanem/ruby-lsp-cell.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
