require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) do
      user = User.create(name: 'Nuri', photo: 'image_link', bio: 'Developer from Macedonia', email: 'test@email',
                         password: 'password', confirmed_at: Time.now)
      get user_posts_path(user_id: user.id)
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('List of all posts')
    end
  end

  describe 'GET #show' do
    before(:each) do
      user = User.create(name: 'Nuri', photo: 'image_link', bio: 'Developer from Macedonia', email: 'test@email',
                         password: 'password', confirmed_at: Time.now)
      post = Post.create(author: user, title: 'My title', text: 'Some text')
      get user_post_path(user_id: user.id, id: post.id)
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:show)
    end

    it 'renders content correctly' do
      expect(response.body).to include('Welcome to post show page')
    end
  end
end
