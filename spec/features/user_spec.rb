# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before :each do
    User.create(id: 2, name: 'Marcelo', username: 'marcelomaidden')
    Article.create(id: 1, author_id: 2, title: 'First article',
                   text: 'Beautiful article made by Marcelo in order to test the code',
                   image: 'url for the image')
    ArticleCategory.create(article_id: 1, category_id: 1)
  end

  let :login do
    visit login_path
    fill_in 'Username', with: 'marcelomaidden'
    click_button 'Log in'
  end

  context 'Register' do
    it 'Creates a new user' do
      visit '/users/new'
      fill_in 'user_name', with: 'imran'
      fill_in 'user_username', with: 'imran56444'
      click_button('Create my account')

      expect(page).to have_text 'Welcome to the app!'
    end
  end

  context 'Users' do
    it "Shows user's informations and useful links" do
      login
      visit '/users/2'

      expect(page).to have_text 'Marcelo'
    end

    it 'Show all users' do
      login

      visit users_path
      expect(page).to have_text 'Marcelo'
    end
  end
end
# rubocop:enable Metrics/BlockLength
