require 'rails_helper'

describe 'Shop' do

  context 'when on the homepage' do
    it 'a user should click a link to go to the shop' do
      visit '/'
      click_link 'Shop'
      expect(current_path).to eq '/shop'
    end
  end

  context 'when on the shop page' do
    it "should display a shop item" do
      Item.create(name: "Jumper", description: "Nice and warm", price: 2)
      visit '/shop'
      expect(page).to have_content 'Jumper'
      expect(page).to have_content 'Nice and warm'
    end

    it 'the user should not see a link to the team info' do
      visit '/shop'
      expect(page).not_to have_link 'Team'
    end

    it 'the user should not see a link to the project info' do
      visit '/shop'
      expect(page).not_to have_link 'About'
    end
  end

  context 'when on the shop page and logged in' do
    before do
      visit '/'
      first(:link, 'Sign up').click
      within ('#new_user_modal') do
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'testtest'
        fill_in 'Password confirmation', with: 'testtest'
        click_button 'Sign up'
      end
      Item.create(name: "Jumper", description: "Nice and warm", price: 2)
    end

    it 'the user should see a buy now link' do
      visit '/shop'
      expect(page).to have_link 'Buy Now'
    end

    xit 'the user should be able to buy the item', js: true do
      visit '/shop'
      click_link 'Buy Now'
      click_link 'Pay with Card'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Card number', with: '4242424242424242'
      fill_in 'MM/YY', with: '06/16'
      fill_in 'CVC', with: '444'
      click_link 'Pay $2.00'
      expect(page).to have_content 'Thanks, you paid'
    end
  end


end
