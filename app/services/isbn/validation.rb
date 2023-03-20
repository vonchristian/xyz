# frozen_string_literal: true

module Isbn
  class Validation < ActiveInteraction::Base
    string :isbn

    validates :isbn, presence: true

    # Check last digit is equal to check digit
    def execute
      outcome = converter(isbn.delete("-").size).run(isbn: isbn)
      if outcome.valid?
        outcome.result.last == isbn.last
      else
        outcome.errors.full_messages
      end
    end

    private

    def converter(isbn_length)
      return "Isbn::Conversions::VersionTen".constantize if isbn_length == 10
      return "Isbn::Conversions::VersionThirteen".constantize if isbn_length == 13

      raise InvalidISBNError
    end
  end
end

class InvalidISBNError < StandardError
end
