# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Albums', type: :request do
  let(:genre) { create(:genre) }
  let(:artist) { create(:artist) }
  subject { create(:album) }

  describe 'GET /v1/albums' do
    before do
      get '/v1/albums', headers: { accept: 'application/json' }
    end

    it 'status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'content type' do
      expect(response.content_type).to eq('application/json')
    end

    it 'payload' do
      json_count = JSON.parse(body).count
      expect(json_count).to eq(Album.count)
    end
  end

  describe 'GET /v1/albums/:id' do
    before do
      get "/v1/albums/#{subject.id}", headers: { accept: 'application/json' }
    end

    it 'status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'content type' do
      expect(response.content_type).to eq('application/json')
    end

    it 'payload' do
      expect(subject.name).to eq(Album.last.name)
    end
  end

  describe 'POST /v1/album' do
    let(:params) do
      { album: {
        name: 'oasis',
        year: '1994',
        artist_attributes: { name: artist.name },
        genre_attributes: { name: genre.name }
      } }
    end

    before do
      post '/v1/albums', params: params, headers: { accept: 'application/json' }
    end

    it 'status code' do
      expect(response).to have_http_status(:created)
    end

    it 'content type' do
      expect(response.content_type).to eq('application/json')
    end

    it 'payload' do
      payload = JSON.parse(response.body)['name']
      expect(payload).to eq(params[:album][:name])
    end
  end

  describe 'PATCH /v1/albums/:id' do
    let(:params) do
      { album: {
        name: 'rollercoaster ride'
      } }
    end

    before do
      patch "/v1/albums/#{subject.id}", params: params, headers: { accept: 'application/json' }
    end

    it 'status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'content type' do
      expect(response.content_type).to eq('application/json')
    end

    it 'payload' do
      payload = JSON.parse(response.body)['name']
      expect(payload).to eq(params[:album][:name])
    end
  end

  describe 'DELETE /v1/albums/:id' do
    before do
      delete "/v1/albums/#{subject.id}", headers: { accept: 'application/json' }
    end

    it 'status code' do
      expect(response).to have_http_status(:no_content)
    end

    it 'content type' do
      expect(response.content_type).to be_nil
    end
  end
end
