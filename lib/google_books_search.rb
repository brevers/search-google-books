# frozen_string_literal: true

require_relative "google_books_search/version"

module GoogleBooksSearch
  class Error < StandardError; end

  class GoogleBooks
    require 'httparty'

    attr_reader :max_results, :url, :result, :current_item

    def initialize(opts = {})
      @max_results = opts[:max_results] || 10
      @result = []
    end

    def search(title)
      # TODO: probably rescue/retry timeouts or quota exceeded errors.
      prepare_url(title)
      response = HTTParty.get(url)
      parse(response)
    end

    private

    def parse(response)
      @result = response.parsed_response

      return if result["items"].nil?

      result["items"].map do |item|
        @current_item = item
        search_result.new(
          parse_authors,
          parse_title,
          parse_isbn_10,
          parse_isbn_13,
          parse_thumbnail
        )
      end
    end

    def parse_thumbnail
      return if volume_info["imageLinks"].blank?

      volume_info["imageLinks"]["thumbnail"]
    end

    def parse_authors
      volume_info["authors"]
    end

    def parse_title
      volume_info["title"]
    end

    def parse_isbn_10
      parse_identifiers.each do |id|
        return id["identifier"] if id["type"] == "ISBN_10"
      end
    end

    def parse_isbn_13
      parse_identifiers.each do |id|
        return id["identifier"] if id["type"] == "ISBN_13"
      end
    end

    def parse_identifiers
      volume_info["industryIdentifiers"] || []
    end

    def volume_info
      current_item["volumeInfo"]
    end

    def search_result
      @search_result ||=
        Struct.new(:authors, :title, :isbn_10, :isbn_13, :image)
    end

    def api_key
      ENV["GOOGLE_API_KEY"] || (raise "Please configure GOOGLE_API_KEY")
    end

    def prepare_url(seach_term)
      @url = "https://www.googleapis.com/books/v1/volumes?q=#{seach_term}&maxResults=#{max_results}&key=#{api_key}"
    end
  end
end
