# spec/features/author_spec.rb
require 'rails_helper'

feature 'author CRUD' do
  scenario 'using web interface' do
    create_new_author
    visit_author_index
    edit_existing_author
    delete_existing_author
  end

  def create_new_author
    visit new_author_path
    fill_in "First name", with: 'Frank'
    fill_in "Last name", with: 'Herbert'
    select '1920', from: 'author_date_of_birth_1i'
    select 'October', from: 'author_date_of_birth_2i'
    select '10', from: 'author_date_of_birth_3i'
    click_button 'Create Author'

    expected_content = %w(Frank Herbert 1920-10-10)

    expect_contents(expected_content)
  end

  def visit_author_index
    # add an additional author to the database so that we
    # can assert that we see multiple authors on the index page
    create :author, first_name: 'Michael', last_name: 'Lewis', date_of_birth: Date.new(1960,10,15)
    visit authors_path

    expected_content = %w(Frank Herbert 1920-10-10 Michael Lewis 1960-10-15)
    # Expect the index table to have three rows, a header row and then one for
    # each author.
    expect(page).to have_css 'tr', count: 3
    expect_contents(expected_content)
  end

  def edit_existing_author
    visit edit_author_path(Author.first)
    fill_in "First name", with: 'JRR'
    fill_in "Last name", with: 'Tolkein'
    select '1892', from: 'author_date_of_birth_1i'
    select 'January', from: 'author_date_of_birth_2i'
    select '3', from: 'author_date_of_birth_3i'
    click_button 'Update Author'

    expected_content = %w(JRR Tolkein 1892-01-03)
    expect_contents(expected_content)
  end

  def delete_existing_author
    visit authors_path
    first(:link, 'Destroy').click
    expect(page).to have_css 'tr', count: 2
  end

  def expect_contents(contents)
    contents.each { |content| expect(page).to have_content content }
  end
end
