# models/genre.rb
class Genre < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  scope :fiction, -> { where(fiction: true) }
  scope :nonfiction, -> { where(fiction: false) }

  default_scope { order(:name) }

  def fiction?
    fiction
  end

  def nonfiction?
    !fiction
  end
end
