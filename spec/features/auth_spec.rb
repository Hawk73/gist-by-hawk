require 'rails_helper'

RSpec.describe 'Auth', type: :feature do
  feature 'Signing in' do
    given!(:user) { create(:user, password: password) }
    given(:password) { 'password' }

    scenario 'Signing in with correct credentials' do
      visit '/auth/sign_in'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: password
      click_button 'Log in'

      expect(page).to have_content('Log out')
      expect(page).not_to have_content('Log in')
    end

    scenario 'Signing in with wrong credentials' do
      visit '/auth/sign_in'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'invalid password'
      click_button 'Log in'

      expect(page).not_to have_content('Log out')
      expect(page).to have_content('Log in')
    end
  end
end
