# frozen_string_literal: true

module Isbn
  module Conversions
    class VersionThirteen < ActiveInteraction::Base
      string :isbn

      validates :isbn, presence: true

      def execute
        return errors.add('Invalid ISBN') unless @isbn.is_a?(String)

        @isbn = isbn.delete("-")

        validate_length
        validate_check_digit

        @isbn
      end

      private

      def validate_length
        return errors.add('Invalid 13 digit ISBN') unless (@isbn.size == 10 || @isbn.size == 13)

        @isbn = @isbn.rjust(13,"978")[/(.+)\w/,1] # adjust to 13 digit isbn and remove check digit

        return errors.add('Invalid 13 digit ISBN') unless @isbn.size == 12  # after adjustments isbn should be 12 digits
      end

      def validate_check_digit
        if check_digit == 10
          @isbn << "0"
        else
          @isbn << check_digit.to_s
        end
      end

      def check_digit
        (10 - (@isbn.split(//).zip([1,3]*6).inject(0) {|s,n| s += n[0].to_i * n[1]} % 10))
      end
    end
  end
end
