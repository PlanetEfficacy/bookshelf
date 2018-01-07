require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#factory' do
    it 'has a valid factory' do
      book = build :book
      expect(book).to be_valid
    end
  end

  describe '#validations' do
    it { should belong_to :author }
    it { should belong_to :genre }
  end
end
