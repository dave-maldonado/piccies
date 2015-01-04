# integration-style tests for picture gallery API
require 'rails_helper'

RSpec.describe 'picture gallery API', type: :request do

  describe '/api/albums' do
    it 'responds with http status 200' do
      get api_albums_path
      expect(response).to have_http_status(200)
    end

    it 'returns correct number of entries' do
      FactoryGirl.create_list(:album, 10)
      get api_albums_path
      json = JSON.parse(response.body)
      expect(json.length).to eq(10)
    end
  end
end
