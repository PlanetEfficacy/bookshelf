# app/models/author.rb
class Author < ApplicationRecord
  validates_presence_of :first_name, :last_name, :date_of_birth

  def display_name
    "#{first_name} #{last_name}"
  end
end
