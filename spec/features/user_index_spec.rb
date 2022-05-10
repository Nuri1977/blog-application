require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Nuri', photo: 'image_link.jpg', bio: 'Developer from Macedonia', email: 'test@email.com',
                        password: 'password', confirmed_at: Time.now)
    @post = Post.create(author: @user, title: 'My title', text: 'My text')
    @like = Like.create(author: @user, post_id: @post.id)
    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'Can see the username.' do
    expect(page).to have_content 'Nuri'
  end

  it 'I can see the users profile picture' do
    expect(page.find('img')['src']).to have_content 'image_link.jpg'
  end

  it 'Can see the number of posts the user has written.' do
    expect(page).to have_content 'posts: 1'
  end

  it 'When I click on a user, I am redirected to that users show page' do
    click_link(@user.id)
    expect(current_path).to eq user_path @user.id
  end
end
