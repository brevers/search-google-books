# frozen_string_literal: true

require_relative "lib/google_books_search/version"

Gem::Specification.new do |spec|
  spec.name = "google_books_search"
  spec.version = GoogleBooksSearch::VERSION
  spec.authors = ["Tamara Brevers"]
  spec.email = ["breversemail@gmail.com"]

  spec.summary = "Search books by title using Google's Books API"
  spec.description = <<-DOC
    Allows users to fetch books information such as author, cover,
    ISBNs, etc... from Google's Books API."
    DOC

  spec.homepage = ""
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.metadata["allowed_push_host"] = ""
  spec.metadata["source_code_uri"] = "https://github.com/brevers/search-google-books.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "httparty"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
