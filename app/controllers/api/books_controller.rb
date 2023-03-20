# frozen_string_literal: true

module API
  class BooksController < ApplicationController
    def show
      outcome = Isbn::Validation.run(isbn: params[:id])
      if outcome.valid? && outcome.result == true
        @book = Book.find_by!(isbn_13: params[:id])
        render json: BookSerializer.new(@book).serializable_hash, status: 200
      elsif outcome.errors.present?
        render json: outcome.errors.full_messages, status: 404
      else
        render json: { error: 'Invalid ISBN' }, status: 400
      end

    rescue ActiveRecord::RecordNotFound
      render json: { error: 'No book found' }, status: 400
    end
  end
end
