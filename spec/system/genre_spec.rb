# spec/system/genre_spec.rb
require 'rails_helper'

describe 'genre crud', type: :system do
  scenario 'using web interface' do
    create_new_genre
    view_all_genres
    edit_genre
    delete_genre
  end

  def create_new_genre
    visit new_genre_path
    fill_in 'Name', with: 'History'
    click_button 'Create Genre'

    expect(page).to have_content 'History'
    expect(page).to have_content 'Fiction: false'
  end

  def view_all_genres
    create :genre, name: 'Philosophy'
    visit genres_path
    expect(page).to have_css 'tr', count: 3
    expect(page).to have_content 'History'
    expect(page).to have_content 'Philosophy'
  end

  def edit_genre
    visit edit_genre_path(Genre.first)
    fill_in 'Name', with: 'Historical Fiction'
    check 'Fiction'
    click_button 'Update Genre'

    expect(page).to have_content 'Historical Fiction'
    expect(page).to have_content 'Fiction: true'
  end

  def delete_genre
    visit genres_path
    first(:link, 'Destroy').click
    expect(page).to have_css 'tr', count: 2
  end
end
