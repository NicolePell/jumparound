require 'rails_helper'

describe 'Liking pictures' do

  before do
    Sighting.create(caption: 'In the toon')
  end

  context 'when signed in' do
    before do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
    end

    it 'should allow user to like a photo', js: true do
      visit '/'
      click_link 'Like'
      expect(page).to have_content '1 like'
    end

  end

  context 'when not signed in' do
    it 'should not allow the user to like a photo' do
      visit '/'

      expect(page).not_to have_link 'Like'
    end
  end

end