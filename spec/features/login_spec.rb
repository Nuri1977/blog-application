require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before(:each) do
    User.create(name: 'Nuri', photo: 'image_link', bio: 'Developer from Macedonia', email: 'test@email.com',
                password: 'password', confirmed_at: Time.now)
    visit user_session_path
  end

  it 'I can see the username and password inputs and the Submit button.' do
    expect(page).to have_field(type: 'email')
    expect(page).to have_field(type: 'password')
    expect(page).to have_button(type: 'submit')
  end

  it 'signs me in' do
    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Welcome to Users page'
  end
end
