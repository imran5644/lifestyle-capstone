require 'rails_helper'

RSpec.feature 'Session' do
  before :each do
    User.create(id: 1, name: 'imran', username: 'imran56444')
    Article.create(id: 1, author_id: 1, title: 'First article',
                   text: 'Beautiful article made in order to test the code',
                   image: 'url for the image')
    ArticleCategory.create(article_id: 1, category_id: 1)
  end

  let :login do
    visit login_path
    fill_in 'Username', with: 'imran56444'
    click_button 'Log in'
  end

  it 'signs me in with the right credentials' do
    login
    expect(page).to have_text 'Log out'
  end

  it 'return an error when wrong username was provided' do
    visit login_path
    fill_in 'Username', with: 'imran'
    click_button 'Log in'
    expect(page).to have_text 'Invalid username combination'
  end

  it 'signs me out' do
    login

    first('a', text: 'Log out').click

    expect(page).to have_text 'Log in'
  end
end
