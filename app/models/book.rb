class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  validates_presence_of :author
  validates_presence_of :genre
  validates_presence_of :title
  validates_presence_of :published
  validates_uniqueness_of :title

  validate :amazon_audible_url


  private

  def amazon_audible_url
    if amazon_and_audible_urls_nil?
      errors.add :base, 'Amazon and Audible urls cannot both be blank.'
    end
  end

  def amazon_and_audible_urls_nil?
    [amazon_url, audible_url].compact.empty?
  end
end
