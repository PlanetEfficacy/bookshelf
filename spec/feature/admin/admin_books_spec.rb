require 'rails_helper'

RSpec.feature 'create book' do
  context 'when a user is signed in' do
    let!(:user) { create :user }
    let!(:author) { create :author }
    let!(:genre) { create :genre }

    before do
      sign_in user
    end

    it 'creates a book' do
      visit new_admin_book_path
      select author.display_name, from: 'Author'
      select genre.name, from: 'Genre'
      fill_in 'Title', with: 'Dune'
      fill_in 'Published', with: "#{DateTime.now}"
      fill_in 'Hours', with: '22'
      click_on 'Create Book'

      expect(current_path).to eq admin_book_path(Book.find_by_title('Dune'))
    end

    context 'when not all required fields are present' do
      it 'redirects with notice' do
        visit new_admin_book_path
        click_on 'Create Book'

        expect(current_path).to eq new_admin_book_path
      end
    end
  end

  context 'when a user is not signed in' do
    it 'redirects to login' do
      visit new_admin_book_path
      expect(current_path).to eq new_user_session_path
    end
  end
end
