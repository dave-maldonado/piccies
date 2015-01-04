# integration-style tests for picture gallery API
require 'rails_helper'

RSpec.describe 'picture gallery API', type: :request do

  describe 'GET /api/albums' do
    it 'responds with http status 200' do
      get api_albums_path
      expect(response).to have_http_status(200)
    end

    it 'responds with properly formatted JSON'

    it 'returns correct number of entries' do
      FactoryGirl.create_list(:album, 10)
      get api_albums_path
      json = JSON.parse(response.body)
      expect(json.length).to eq(10)
    end
  end

  describe 'GET /api/albums/1' do
    it 'responds with http status 200'

    it 'responds with properly formatted JSON'
  end

  describe 'POST /api/albums' do
    it 'responds with http status 201'
  end

  describe 'PATCH /api/albums' do
    it 'responds with http status 204'
  end

  describe 'DELETE /api/albums/1' do
    it 'responds with http status 204'
  end

  describe 'GET /api/albums/1/pictures' do
    it 'responds with http status 200'

    it 'responds with properly formatted JSON'

    it 'returns correct number of entries'
  end

  describe 'GET /api/albums/1/pictures/1' do
    it 'responds with http status 200'

    it 'responds with properly formatted JSON'
  end

  describe 'POST /api/albums/1/pictures' do
    it 'responds with http status 201'
  end

  describe 'PATCH /api/albums/1/pictures/1' do
    it 'responds with http status 204'
  end

  describe 'DELETE /api/albums/1/pictures/1' do
    it 'responds with http status 204'
  end
end
