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
				Sighting.create(caption: "Fog on the tyne")
			end

			it "Should appear on the page" do
				visit '/'
				expect(page).to have_content "Fog on the tyne"
			end
		end

		context "Sightings can be posted" do

			before do
				visit '/'
				click_link 'Sign up'
				fill_in 'Email', with: 'test@test.com'
				fill_in 'Password', with: 'testtest'
				fill_in 'Password confirmation', with: 'testtest'
				click_button 'Sign up'
			end

			it "should prompt a user to complete a form" do
				visit '/'
				click_link 'Add Sighting'
				fill_in 'Caption', with: 'In the Queen Vic'
				click_button 'Create Sighting'

				expect(page).to have_content 'In the Queen Vic'
				expect(current_path).to eq '/'
			end

			it "should allow a photo to be uploaded with the sighting" do
				visit '/'
				click_link 'Add Sighting'
				fill_in 'Caption', with: 'In the Queen Vic'
				attach_file 'Image', Rails.root.join(Rails.root, 'spec', 'test_photo.jpeg')
				click_button 'Create Sighting'

				expect(page).to have_content 'In the Queen Vic'
				expect(current_path).to eq '/'
			end
		end

	end