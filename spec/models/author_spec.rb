# spec/models/author_spec.rb
require 'rails_helper'

RSpec.describe Author, type: :model do
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:date_of_birth) }

    it "raises error for duplicate records" do
      create :author, first_name: 'Frank', last_name: 'Herbert', date_of_birth: Date.new(1920,10,10)
      author = build :author, first_name: 'Frank', last_name: 'Herbert', date_of_birth: Date.new(1920,10,10)
      expect { author.save! }.to raise_error ActiveRecord::RecordNotUnique
    end
  end

  describe '#display_name' do
    it 'returns concatenated first and last name' do
      author = create :author, first_name: 'Frank', last_name: 'Herbert'
      expect(author.display_name).to eq 'Frank Herbert'
    end
  end
end
