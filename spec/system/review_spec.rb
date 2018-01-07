# spec/system/book_spec.rb
require 'rails_helper'

describe 'review crud', type: :system do
  let!(:book) { create :book }
  scenario 'using web interface' do
    create_new_review
    edit_review
    delete_review
  end

  def create_new_review
  visit new_review_path
    select("#{book.title}", from: "book[book_id]").select_option
    fill_in "Body", with: "My great review."
    click_button "Create Review"

    expect(page).to have_content book.author.display_name
    expect(page).to have_content book.genre.name
    expect(page).to have_content 'My great review'
  end

  def edit_review
    visit edit_review_path(Review.first)
    fill_in 'Body', with: 'A New Body'
    click_button 'Update Review'

    expect(page).to have_content 'A New Body'
  end

  def delete_review
    visit reviews_path
    first(:link, 'Destroy').click
    expect(page).to have_css 'tr', count: 1
  end
end
