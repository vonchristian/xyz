# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    if params[:search].present?
      @books = Book.includes(:authors, :publisher).text_search(params[:search])
    else
      @books = Book.all.includes(:authors, :publisher)
    end
  end
end
