class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :author, foreign_key: true
      t.references :genre, foreign_key: true
      t.text :title
      t.date :published
      t.integer :hours
      t.integer :pages
      t.string :amazon_url
      t.string :audible_url

      t.timestamps
    end
  end
end
