# frozen_string_literal: true

require 'rails_helper'

describe 'Book#show' do
  let(:valid_isbn_13) { "9781566199094" }
  let(:valid_isbn_10) { "1566199093" }

  context 'with valid isbn' do
    context 'when version 10' do
      before { get "/api/isbn_conversions/#{valid_isbn_10}" }

      it { expect(JSON.parse(response.body)).to eq("isbn" => valid_isbn_13) }
    end

    context 'when version 13' do
      before { get "/api/isbn_conversions/#{valid_isbn_13}" }

      it { expect(JSON.parse(response.body)).to eq("isbn" => valid_isbn_10) }
    end
  end

  context 'with invalid isbn' do
    before { get "/api/isbn_conversions/:invalid-isbn" }

    it { expect(JSON.parse(response.body)).to eq("error" => "Invalid ISBN") }
  end
end

