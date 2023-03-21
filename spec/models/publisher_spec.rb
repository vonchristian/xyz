# frozen_string_literal: true

require 'rails_helper'

describe Publisher do
  describe 'associations' do
    it { is_expected.to have_many :books }
  end
end
