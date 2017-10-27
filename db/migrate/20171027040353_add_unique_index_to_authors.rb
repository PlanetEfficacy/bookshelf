# db/migrate/20171027040353_add_unique_index_to_authors.rb
class AddUniqueIndexToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_index :authors, [:first_name, :last_name, :date_of_birth], unique: true
  end
end
