require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'Response status when requesting => :ok' do
      get '/users/3/posts'
      expect(response).to have_http_status(:ok)
    end
    it 'Render the correct template' do
      get '/users/3/posts'
      expect(response).to render_template(:index)
    end
    it 'Render the correct placeholder text' do
      get '/users/3/posts'
      expect(response.body).to include('Here is a user list of posts')
    end
    it 'does not render a different template' do
      get '/users/3/posts'
      expect(response).to_not render_template(:show)
    end
  end

  describe 'GET /show' do
    it 'Response status when requesting => :ok' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:ok)
    end
    it 'Render the correct template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end
    it 'Render the correct placeholder text' do
      get '/users/1/posts/1'
      expect(response.body).to include('Here is a user single post')
    end
    it 'does not render a different template' do
      get '/users/1/posts/1'
      expect(response).to_not render_template(:index)
    end
  end
end
