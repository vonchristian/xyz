# frozen_string_literal: true

require "rails_helper"

describe Isbn::Validation do
  context 'with invalid isbn' do
    it do
      outcome = described_class.run(isbn: 'test')

      expect(outcome.errors[:isbn]).to match_array('is invalid')
    end
  end

  context 'with valid isbn' do
    let!(:book) { create(:book) }

    it do
      outcome = described_class.run(isbn: book.isbn_13)

      expect(outcome.result).to be_truthy
    end
  end
end
