require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(build(:user)).to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:books).dependent(:destroy) }
    it { should have_many(:reviews).dependent(:destroy) }
  end
end
