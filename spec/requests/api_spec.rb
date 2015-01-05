# integration-style tests for picture gallery API
require 'rails_helper'

RSpec.describe 'picture gallery API', type: :request do
  describe 'GET /api/albums' do
    it 'responds with http status 200' do
      get api_albums_path
      expect(response).to have_http_status 200
    end

    it 'returns correct attributes' do
      albums = FactoryGirl.create_list(:album, 10)
      get api_albums_path
      records = JSON.parse(response.body)
      records.each.with_index do |record, index|
        expect(record['name']).to eq albums[index].name
        expect(record['description']).to eq albums[index].description
      end
    end

    it 'returns correct number of entries' do
      FactoryGirl.create_list(:album, 10)
      get api_albums_path
      json = JSON.parse(response.body)
      expect(json.length).to eq 10
    end
  end

  describe 'GET /api/albums/1' do
    it 'responds with http status 200'do
      FactoryGirl.create :album
      get api_album_path(1)
      expect(response).to have_http_status 200
    end

    it 'returns correct attributes' do
      album = FactoryGirl.create :album
      get api_album_path(1)
      record = JSON.parse(response.body)
      expect(record['name']).to eq album.name
      expect(record['description']).to eq album.description
    end
  end

  describe 'POST /api/albums' do
    it 'responds with http status 201' do
      post api_albums_path, FactoryGirl.attributes_for(:album)
      expect(response).to have_http_status 201
    end
  end

  describe 'PATCH /api/albums/1' do
    it 'responds with http status 204' do
      FactoryGirl.create :album
      patch api_album_path(1),  name: "Dave's Incredible Fishtanks!"
      expect(response).to have_http_status 204
    end

    it 'changes an attribute of a record' do
      FactoryGirl.create :album
      patch api_album_path(1),  name: "Dave's Incredible Fishtanks!"
      get api_album_path(1)
      record = JSON.parse(response.body)
      expect(record['name']).to eq "Dave's Incredible Fishtanks!"
    end
  end

  describe 'DELETE /api/albums/1' do
    it 'responds with http status 204' do
      FactoryGirl.create :album
      delete api_album_path(1)
      expect(response).to have_http_status 204
    end
  end

  describe 'GET /api/albums/1/pictures' do
    it 'responds with http status 200' do
      FactoryGirl.create :album_with_pictures
      get api_album_pictures_path(1)
      expect(response).to have_http_status 200
    end

    it 'returns correct attributes' do
      picture = FactoryGirl.create :album_with_pictures
      get api_album_pictures_path(1)
      record = JSON.parse(response.body)
      puts "record['id'] -> #{record['id']}, picture.id -> #{picture.id}"
      expect(record['id']).to eq picture.id
    end

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
