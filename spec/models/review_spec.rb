require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'factory' do
    it 'is valid' do
      review = build :review
      expect(review).to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:book) }
    it { should belong_to(:user) }
  end
end
