# frozen_string_literal: true

module Isbn
  class Validation < ActiveInteraction::Base
    string :isbn

    validates :isbn, presence: true

    def execute
      return errors.add(:isbn, 'is invalid') unless Isbn::Converter::VALID_ISBN_LENGTH.include?(isbn.delete("-").size)
      return outcome.errors.full_messages if outcome.errors.present?

      compare_check_digits
    end

    def outcome
      @outcome ||= converter_class.run(isbn: isbn)
    end

    def converter_class
      Isbn::Converter.run(isbn: isbn).result
    end

    def compare_check_digits
      outcome.result.last == isbn.last
    end
  end
end
