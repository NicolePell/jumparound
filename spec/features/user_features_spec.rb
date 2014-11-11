require 'rails_helper'

context 'user not signed in and on the homepage' do
  it 'should see a sign up and sign in link' do
    visit '/'
    expect(page).to have_link 'Sign in'
    expect(page).to have_link 'Sign up'
  end
end

context 'user signed in and on the homepage' do
  it 'should see a sign out link' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'testtest'
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
    expect(page).to have_link 'Sign out'
    expect(page).not_to have_link 'Sign in'
  end

end
