require 'rails_helper'

  describe 'Sightings' do

    context 'No Sightings posted' do

      it "should say that there has been no sightings" do
        visit '/'
        expect(page).to have_content "Sean's jumper is nowhere to be seen!"
      end
    end

    context "Sightings are posted" do

      before do
        Sighting.create(caption: "Fog on the tyne", seen_at: '12/03/2014')
      end

      it "Should appear on the page" do
        visit '/'
        expect(page).to have_content "Fog on the tyne"
      end
    end

    context "Sightings can be posted" do

      before do
        visit '/'
        first(:link, 'Sign up').click
        within ('#new_user_modal') do
          fill_in 'Email', with: 'test@test.com'
          fill_in 'Password', with: 'testtest'
          fill_in 'Password confirmation', with: 'testtest'
          click_button 'Sign up'
        end
        first(:link, 'Add Sighting').click
        within ('#new_sighting_modal') do
          fill_in 'Caption', with: 'In the Queen Vic'
          fill_in 'Seen at', with: '12/03/2014'
          attach_file 'Image', Rails.root.join(Rails.root, 'spec', 'test_photo.jpeg')
          click_button 'Add Sighting'
        end
      end

      it "should prompt a user to complete a form" do
        visit '/'
        expect(page).to have_content 'In the Queen Vic'
        expect(current_path).to eq '/'
      end

      it "should allow a photo to be uploaded with the sighting" do
        visit '/'
        expect(page).to have_content 'In the Queen Vic'
        expect(current_path).to eq '/'
      end
    end

    context 'Gallery page' do

      before do
        Sighting.create(caption: "Fog on the tyne", seen_at: '12/03/2014')
        Sighting.create(caption: "Fog on the moor", seen_at: '12/03/2014')
        visit '/'
        first(:link, 'Sign up').click
        within ('#new_user_modal') do
          fill_in 'Email', with: 'test@test.com'
          fill_in 'Password', with: 'testtest'
          fill_in 'Password confirmation', with: 'testtest'
          click_button 'Sign up'
        end
      end

      it 'should show the most liked sighting', js: true do
        visit '/'
        first(:link, 'Like').click
        visit '/gallery'
        expect(page).to have_content 'Fog on the moor', count: 2
        expect(page).to have_content 'Most liked sighting'
      end

    end

  end
