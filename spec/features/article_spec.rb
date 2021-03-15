require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
  before :each do
    User.create(id: 1, name: 'Marcelo', username: 'marcelomaidden')
    Article.create(id: 1, author_id: 1, title: 'First article',
                   text: 'Beautiful article made by Marcelo in order to test the code',
                   image: 'url for the image')
    ArticleCategory.create(article_id: 1, category_id: 1)
  end

  let :login do
    visit login_path
    fill_in 'Username', with: 'marcelomaidden'
    click_button 'Log in'
  end

  context 'Write an article' do
    it 'Renders template to write an article' do
      login
      visit root_path

      first('a', text: 'Create an article').click

      expect(page).to have_content(/Create an article/i)
    end

    it 'Returns validation errors if user tries to create article without fill information' do
      login
      visit new_article_path
      click_on 'Create Article'

      expect(page).to have_text "can't be blank"
    end
  end
end
