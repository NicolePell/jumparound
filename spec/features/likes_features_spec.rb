require 'rails_helper'

describe 'Liking pictures' do

  before do
    Sighting.create(caption: 'In the toon', seen_at: '12/03/2014')
  end

  context 'when signed in' do
    before do
      visit '/'
      first(:link, 'Sign up').click
      within ('#new_user_modal') do
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'testtest'
        fill_in 'Password confirmation', with: 'testtest'
        click_button 'Sign up'
      end
    end

    it 'should allow user to like a sighting', js: true do
      visit '/'
      click_link 'Like'
      expect(page).to have_content '1 like'
    end

    it 'should not allow a user to like a sighting more than once', js: true do
      visit '/'
      click_link 'Like'
      expect(page).not_to have_link 'Like'
    end

    it 'should let a user know when they have previously liked a sighting', js: true do
      visit '/'
      click_link 'Like'
      visit '/'
      expect(page).to have_content 'You liked this sighting'
    end
  end

  context 'when not signed in' do
    it 'should not allow the user to like a sighting' do
      visit '/'
      expect(page).not_to have_link 'Like'
    end
  end

end
