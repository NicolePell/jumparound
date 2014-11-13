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
  end


end
