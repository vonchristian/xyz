# frozen_string_literal: true

require 'rails_helper'

describe 'Book#show' do
  let!(:book) { create(:book) }

  context 'with valid isbn' do
    before { get "/api/books/#{book.isbn_13}" }

    it { expect(JSON.parse(response.body)).to eq JSON.parse(BookSerializer.new(book).to_json) }
  end

  context 'with invalid isbn' do
    before { get "/api/books/:invalid-isbn" }

    it { expect(JSON.parse(response.body)).to eq(['Isbn is invalid']) }
  end
end

