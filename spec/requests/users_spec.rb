require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) do
      get '/users'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Welcome to Users page')
    end

    describe 'GET #show' do
      before(:each) do
        user = User.create(name: 'Nuri', photo: 'image_link', bio: 'Developer from Macedonia', email: 'test@email',
          password: 'password', confirmed_at: Time.now)
        get user_path(id: user.id)
      end

      it 'GET requests response status was correct' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders a correct template' do
        expect(response).to render_template(:show)
      end

      it 'renders content correctly' do
        expect(response.body).to include('List of recent Posts')
      end
    end
  end
end
