# frozen_string_literal: true

require 'rails_helper'

describe Author do
  subject(:author) { described_class.new }

  describe 'associations' do
    it { expect(author).to have_many(:authorships).dependent(:destroy) }
    it { expect(author).to have_many(:books) }
  end

  describe '.full_names' do
    let!(:author1) { create(:author, first_name: 'John', middle_name: 'D.', last_name: 'Doe') }
    let!(:author2) { create(:author, first_name: 'Johnny', middle_name: 'D.', last_name: 'Doe') }

    it { expect(described_class.full_names).to eq("John D. Doe, Johnny D. Doe") }
  end

  describe '#full_name' do
    let!(:author) { create(:author, first_name: 'John', middle_name: 'D.', last_name: 'Doe') }

    it { expect(author.full_name). to eq('John D. Doe') }
  end
end
