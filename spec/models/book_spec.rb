require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#factory' do
    it 'has a valid factory' do
      book = build :book
      expect(book).to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:genre) }
    it { should belong_to(:author) }
    it { should belong_to(:user) }
  end

  describe '#validations' do
    it { should belong_to :author }
    it { should belong_to :genre }
    it { should validate_presence_of :author }
    it { should validate_presence_of :genre }
    it { should validate_presence_of :title }
    it { should validate_presence_of :published }
    it { should validate_uniqueness_of :title }

    describe 'amazon url and audible url' do
      let(:amazon_url) { 'https://www.amazon.com' }
      let(:audible_url) { 'https://www.audible.com' }

      context 'when both are present' do
        it 'is valid' do
          subject = build :book, amazon_url: amazon_url, audible_url: audible_url
          expect(subject).to be_valid
        end
      end

      context 'when only amazon url is present' do
        it 'is valid' do
          subject = build :book, amazon_url: amazon_url, audible_url: nil
          expect(subject).to be_valid
        end
      end

      context 'when only audible url is present' do
        it 'is valid' do
          subject = build :book, amazon_url: nil, audible_url: audible_url
          expect(subject).to be_valid
        end
      end

      context 'when neither url is present' do
        it 'is not valid' do
          subject = build :book, amazon_url: nil, audible_url: nil
          expect(subject).to be_invalid
        end
      end
    end
  end
end
