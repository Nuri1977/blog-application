require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Nuri', photo: 'image_link.jpg', bio: 'Developer from Macedonia', email: 'test@email.com',
                        password: 'password', confirmed_at: Time.now)
    (1..5).each { |i| @user.posts.create title: "Post number #{i}", text: "This is my #{i} post!" }
    @post = Post.create(author: @user, title: 'My title', text: 'My text')
    @comment = Comment.create(text: 'My first comment', author: @user, post_id: @post.id)
    @like = Like.create(author: @user, post_id: @post.id)
    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit user_posts_path @user.id
  end

  it 'I can see the users profile picture.' do
    expect(page.find('img')['src']).to have_content 'image_link.jpg'
  end

  it 'Can see the username.' do
    expect(page).to have_content 'Nuri'
  end

  it 'Can see the number of posts the user has written.' do
    expect(page).to have_content 'posts: 6'
  end

  it 'Can see a posts title' do
    expect(page).to have_content 'My title'
  end

  it 'Can see some of the posts body' do
    expect(page).to have_content 'My text'
  end

  it 'Can see the first comments on a post' do
    expect(page).to have_content 'My first comment'
  end

  it 'Can see how many comments a post has' do
    expect(page).to have_content 'Comments: 1'
  end

  it 'Can see how many likes a post has' do
    expect(page).to have_content 'Likes: 1'
  end

  it 'When I click on a post, it redirects me to that posts show page' do
    click_link(@post.id)
    expect(current_path).to eq user_post_path(user_id: @post.author_id, id: @post.id)
  end
end
