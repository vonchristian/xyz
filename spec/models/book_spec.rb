# frozen_string_literal: true

require 'rails_helper'

describe Book do
  subject(:book) { described_class.new }

  describe 'associations' do
    it { expect(book).to belong_to :publisher }
    it { expect(book).to have_many(:authorships).dependent(:destroy) }
    it { expect(book).to have_many :authors }
  end

  describe 'validations' do
    it { expect(book).to validate_presence_of :title }
    it { expect(book).to validate_presence_of :price_cents }
  end

  describe 'delegations' do
    it  { is_expected.to delegate_method(:name).to(:publisher).with_prefix }
  end

  describe '#authors_name' do
    let!(:book) { create(:book) }

    it do
      expect(book.authors).to receive(:full_names)

      book.authors_name
    end
  end
end
