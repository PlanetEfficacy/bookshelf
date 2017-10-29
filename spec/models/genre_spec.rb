# spec/models/genre_spec.rb
require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "Scopes" do
    let!(:fiction) { create :genre, name: 'Science Fiction', fiction: true }
    let!(:nonfiction) { create :genre, name: 'Biology', fiction: false }

    describe "fiction" do
      let(:result) { described_class.fiction }

      it "returns all fictional genres" do
        expect(result.count).to eq 1
        expect(result.first).to eq fiction
      end
    end

    describe "nonfiction" do
      let(:result) { described_class.nonfiction }

      it "returns all nonfiction genres" do
        expect(result.count).to eq 1
        expect(result.first).to eq nonfiction
      end
    end
  end

  describe "#fiction?" do
    context "when a genre is fictional" do
      let(:genre) { create :genre, fiction: true }

      it "returns true" do
        expect(genre.fiction?).to eq true
      end
    end

    context "when a genre is nonfiction" do
      let(:genre) { create :genre, fiction: false }

      it "returns true" do
        expect(genre.fiction?).to eq false
      end
    end
  end

  describe "#nonfiction?" do
    context "when a genre is fictional" do
      let(:genre) { create :genre, fiction: true }

      it "returns true" do
        expect(genre.nonfiction?).to eq false
      end
    end

    context "when a genre is nonfiction" do
      let(:genre) { create :genre, fiction: false }

      it "returns true" do
        expect(genre.nonfiction?).to eq true
      end
    end
  end
end
