# frozen_string_literal: true

require "rails_helper"

describe Isbn::Converter do
  context 'with invalid isbn' do
    it do
      outcome = described_class.run(isbn: 'test')

      expect(outcome.errors[:isbn]).to match_array('is invalid')
    end
  end

  context 'with isbn version 10' do
    it do
      outcome = described_class.run(isbn: "1-56619-909-3")

      expect(outcome.result).to eq Isbn::Conversions::VersionTen
    end
  end

  context 'with isbn version 10' do
    it do
      outcome = described_class.run(isbn: "978-1-56619-909-4")

      expect(outcome.result).to eq Isbn::Conversions::VersionThirteen
    end
  end
end
