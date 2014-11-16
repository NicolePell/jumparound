require 'rails_helper'

  describe 'Homepage' do

    context 'when on the homepage' do
      before do
        Sighting.create(caption: "Fog on the tyne", seen_at: '12/03/2014')
        Sighting.create(caption: "Fog on the moor", seen_at: '12/03/2014')
        Sighting.create(caption: "Fog on the hill", seen_at: '12/03/2014')
        Sighting.create(caption: "Fog on the mountain", seen_at: '12/03/2014')
        Sighting.create(caption: "Fog on the downs", seen_at: '12/03/2014')
      end

      it 'the user should see the four most recent sightings' do
        visit '/'
        expect(page).not_to have_content "Fog on the tyne"
      end

      it 'the user should see a link to the shop' do
        visit '/'
        click_link 'Shop'
        expect(current_path).to eq '/shop'
      end

      it 'the user should see a link to the gallery' do
        visit '/'
        first(:link, 'Gallery').click
        expect(current_path).to eq '/gallery'
      end

      it 'the user should see a link to the team info' do
        visit '/'
        expect(page).to have_link 'Team'
      end

      it 'the user should see a link to the project info' do
        visit '/'
        expect(page).to have_link 'About'
      end
    end

end
