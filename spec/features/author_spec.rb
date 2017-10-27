# spec/features/author_spec.rb
require 'rails_helper'

feature 'User creates an author' do
  scenario 'they see the author on the page' do
    visit new_author_path

    fill_in "First name", with: 'Frank'
    fill_in "Last name", with: 'Herbert'
    select '1920', from: 'author_date_of_birth_1i'
    select 'October', from: 'author_date_of_birth_2i'
    select '10', from: 'author_date_of_birth_3i'
    click_button 'Create Author'

    expect(page).to have_content 'Frank'
    expect(page).to have_content 'Herbert'
    expect(page).to have_content '1920-10-10'
  end
end
