# frozen_string_literal: true

module API
  class IsbnConversionsController < ApplicationController
    REVERSED_CONVERTERS =
    {
      "Isbn::Conversions::VersionTen" => Isbn::Conversions::VersionThirteen,
      "Isbn::Conversions::VersionThirteen" => Isbn::Conversions::VersionTen
    }

    def show
      @isbn = params[:id]
      return render json: { error: 'Invalid ISBN' } if reversed_converter.blank?

      if outcome.valid?
        render json: { isbn: outcome.result }, status: 200
      else
        render json: outcome.errors.full_messages, status: 404
      end
    end

    private

    def outcome
      @outcome ||= reversed_converter.run(isbn: @isbn)
    end

    def converter
      Isbn::Converter.run(isbn: @isbn).result
    end

    def reversed_converter
      REVERSED_CONVERTERS[converter.to_s]
    end
  end
end
