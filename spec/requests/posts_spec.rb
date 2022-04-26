require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) do
      get '/users/0/posts'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Welocme to posts page')
    end

    describe 'GET #show' do
      before(:each) do
        get '/users/1/posts/1'
      end

      it 'GET requests response status was correct' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders a correct template' do
        expect(response).to render_template(:show)
      end

      it 'renders content correctly' do
        expect(response.body).to include('Welcome to show page')
      end
    end
  end
end
