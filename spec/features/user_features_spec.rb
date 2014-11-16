require 'rails_helper'

context 'user not signed in and on the homepage' do
  it 'should see a sign up and sign in link' do
    visit '/'
    expect(page).to have_link 'Sign in'
    expect(page).to have_link 'Sign up'
  end

  it 'should see a Sign in with Facebook link' do
    visit '/'
    expect(page).to have_link 'Sign in with Facebook'
  end
end

context 'user signed in and on the homepage' do
  it 'should see a sign out link' do
    visit '/'
    first(:link, 'Sign up').click
    within ('#new_user_modal') do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
    end
    expect(page).to have_link 'Sign out'
    expect(page).not_to have_link 'Sign in', exact: true
  end

end
