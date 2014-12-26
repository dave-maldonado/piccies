require 'rails_helper'

RSpec.describe 'Pictures', type: :request do
  describe 'GET /pictures' do
    it 'responds with http status 200' do
      get api_pictures_path
      expect(response).to have_http_status(200)
    end
  end
end
