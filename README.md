# GoogleBooksSearch
## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add google_books_search

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install google_books_search

## Usage
Before running any searches do not forget to set `GOOGLE_API_KEY` using your own Google `API_KEY`

Note: There are several way to do this, but the most common ones are just exporting the variable or adding it to you `.env` file.

Once the `API_KEY` is setup, just include the module and run some searches :)

```rb
include GoogleBooksSearch

google_books = GoogleBooks.new(max_results: 5)
google_books.search("Chatter")

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/google_books_search.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
