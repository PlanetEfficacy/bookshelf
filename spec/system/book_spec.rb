# spec/system/book_spec.rb
require 'rails_helper'

describe 'book crud', type: :system do
  let!(:author) { create :author }
  let!(:genre)  { create :genre }
  scenario 'using web interface' do
    create_new_book
    view_all_books
    edit_book
    delete_book
  end

  def create_new_book
    visit new_book_path
    select("#{author.display_name}", from: "author[author_id]").select_option
    select("#{genre.name}", from: "genre[genre_id]").select_option
    fill_in "Title", with: "My Great Title"
    select "2017", from: "book_published_1i"
    select "October", from: "book_published_2i"
    select "10", from: "book_published_3i"
    fill_in "Hours", with: "21"
    fill_in "Pages", with: "400"
    fill_in "Amazon url", with: "www.amazon.com"
    fill_in "Audible url", with: "www.audible.com"
    click_button "Create Book"

    expect(page).to have_content author.display_name
    expect(page).to have_content genre.name
    expect(page).to have_content "2017-10-10"
    expect(page).to have_content "21"
    expect(page).to have_content "400"
    expect(page).to have_content "www.amazon.com"
    expect(page).to have_content "www.audible.com"
  end

  def view_all_books
    book = create :book, author: author, genre: genre
    visit books_path
    expect(page).to have_css 'tr', count: 3
    expect(page).to have_content 'My Great Title'
    expect(page).to have_content book.title
  end

  def edit_book
    visit edit_book_path(Book.first)
    fill_in 'Title', with: 'A New Title'
    click_button 'Update Book'

    expect(page).to have_content 'A New Title'
  end

  def delete_book
    visit books_path
    first(:link, 'Destroy').click
    expect(page).to have_css 'tr', count: 2
  end
end
