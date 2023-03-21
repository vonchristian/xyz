# frozen_string_literal: true

module Isbn
  class Converter < ActiveInteraction::Base
    VALID_ISBN_LENGTH = [10, 13].freeze

    CONVERTERS = {
      10 => "Isbn::Conversions::VersionTen",
      13 => "Isbn::Conversions::VersionThirteen"
    }

    string :isbn
    boolean :reversed, default: false

    validates :isbn, presence: true

    def execute
      return errors.add(:isbn, 'is invalid') unless VALID_ISBN_LENGTH.include?(isbn.delete("-").size)

      CONVERTERS[isbn.delete("-").size].constantize
    end
  end
end
