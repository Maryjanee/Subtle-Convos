require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'Login functionality' do
    it 'logs a user in' do
      User.create(name: 'user1', full_name: 'user one')
      visit access_login_path
      within('form') do
        fill_in 'username', with: 'user1'
      end
      click_button 'Log In'
      find('nav').click_link('Home')
    end

    it 'logs a user out' do
      User.create(name: 'user1', full_name: 'user one')
      visit access_login_path
      within('form') do
        fill_in 'name', with: 'user1'
      end
      click_button 'Log In'
      click_link 'Logout'
      visit access_login_path
      find('p').click_link('Sign Up')
    end

    it 'Informs user of the existence of a username' do
      visit access_login_path
      within('form') do
        fill_in 'username', with: 'mj'
      end
      click_button 'Log In'
      expect(find('.notice')).to have_content('Username not found, please try again')
    end
  end
end

RSpec.feature 'Users', type: :feature do
  describe 'New User Sign Up' do
    it 'creates a new user' do
      visit access_login_path
      visit new_user_path
      within('form') do
        fill_in 'user[name]', with: 'John'
        fill_in 'user[full_name]', with: 'John Doe'
      end
      expect { click_button 'Sign Up' }.to change(User, :count).by(1)
    end
  end
end
