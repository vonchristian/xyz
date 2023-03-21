# frozen_string_literal: true

require "rails_helper"

describe Isbn::Conversions::VersionTen do
  context 'with invalid isbn' do
    it do
      outcome = described_class.run(isbn: 'test')

      expect(outcome.errors[:isbn]).to match_array('is invalid')
    end
  end

  describe 'with valid isbn' do
    let(:valid_isbn_13) { "9781566199094" }
    let(:valid_isbn_10) { "1566199093" }

    context 'with version 10' do
      it do
        outcome = described_class.run(isbn: valid_isbn_10)

        expect(outcome.result).to eq(valid_isbn_10)
      end
    end

    context 'with version 13' do
      it do
        outcome = described_class.run(isbn: valid_isbn_13)

        expect(outcome.result).to eq(valid_isbn_10)
      end
    end
  end
end
