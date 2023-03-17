# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    if params[:search].present?
      @books = Book.text_search(params[:search])
    else
      @books = Book.all
    end
  end
end
