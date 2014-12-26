require 'rails_helper'

RSpec.describe 'Albums', type: :request do
  describe 'GET /albums' do
    it 'responds with http status 200' do
      get api_albums_path
      expect(response).to have_http_status(200)
    end
  end
end
