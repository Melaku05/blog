require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET /users' do
    it 'returns a list of users' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the index.html.erb template' do
      get '/users'
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/1' do
    it 'renders a show.html.erb template' do
      get '/users/1'
      expect(response).to render_template('show')
    end
  end
end
