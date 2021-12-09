require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'Response status when requesting => :ok' do
      get '/users'
      expect(response).to have_http_status(:ok)
    end
    it 'Render the correct template' do
      get '/users'
      expect(response).to render_template(:index)
    end
    it 'Render the correct placeholder text' do
      get '/users'
      expect(response.body).to include('Here is a list of users')
    end
    it 'does not render a different template' do
      get '/users/:user_id/posts'
      expect(response).to_not render_template(:show)
    end
  end

  describe 'GET /show' do
    it 'Response status when requesting => :ok' do
      get '/users/:user_id'
      expect(response).to have_http_status(:ok)
    end
    it 'Render the correct template' do
      get '/users/:user_id'
      expect(response).to render_template(:show)
    end
    it 'Render the correct placeholder text' do
      get '/users/:user_id'
      expect(response.body).to include('Here is a user profile')
    end
    it 'does not render a different template' do
      get '/users/:user_id'
      expect(response).to_not render_template(:index)
    end
  end
end
