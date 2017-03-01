require 'rails_helper'

RSpec.describe 'Snippets', type: :feature do
  feature 'Creating snippet' do
    given(:user) { create(:user) }
    given(:snippet) { build(:snippet) }

    background do
      sign_in(user)
      visit '/snippets/new'
    end

    scenario 'Creating with correct params' do
      fill_in 'Name', with: snippet.name
      fill_in 'Text', with: snippet.text
      click_button 'Create'

      expect(page).to have_content('Snippet has been created successfully.')
    end

    scenario 'Creating with invalid params' do
      fill_in 'Name', with: ''
      fill_in 'Text', with: snippet.text
      click_button 'Create'

      expect(page).not_to have_content('Snippet has been created successfully.')
      expect(page).to have_content("can't be blank")
    end
  end
end
