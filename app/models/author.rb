# app/models/author.rb
class Author < ApplicationRecord
  validates_presence_of :first_name, :last_name, :date_of_birth
end
