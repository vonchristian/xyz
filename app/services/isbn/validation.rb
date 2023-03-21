# frozen_string_literal: true

module Isbn
  class Validation < ActiveInteraction::Base
    VALID_ISBN_LENGTH = [10, 13].freeze
    CONVERTERS = {
      10 => "Isbn::Conversions::VersionTen",
      13 => "Isbn::Conversions::VersionThirteen"
    }

    string :isbn

    validates :isbn, presence: true

    def execute
      return errors.add(:isbn, 'is invalid') unless VALID_ISBN_LENGTH.include?(isbn.delete("-").size)
      return outcome.errors.full_messages if outcome.errors.present?

      compare_check_digits
    end

    private

    def outcome
      @outcome ||= find_converter.run(isbn: isbn)
    end

    def find_converter
      CONVERTERS[isbn.delete("-").size].constantize
    end

    def compare_check_digits
      outcome.result.last == isbn.last
    end
  end
end
