# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Artists', type: :request do
  describe 'GET /v1/artists' do
    describe 'status & response' do
      before do
        get '/v1/artists'
      end

      it 'has OK status' do
        expect(response).to have_http_status(:ok)
      end

      it 'is JSON' do
        expect(response.content_type).to eq('application/json')
      end
    end

    describe 'body' do
      let!(:oasis) { create(:artist, name: 'oasis') }
      let!(:radiohead) { create(:artist, name: 'radiohead') }
      let(:response) do
        [
          { 'id' => oasis.id, 'name' => oasis.name, 'albums' => [] },
          { 'id' => radiohead.id, 'name' => radiohead.name, 'albums' => [] }
        ]
      end

      before do
        get '/v1/artists'
      end

      it 'is simple response' do
        expect(JSON.parse(body)).to eq(response)
      end
    end
  end

  describe 'GET /v1/artists/:id' do
    let(:radiohead) { create(:artist, name: 'radiohead') }
    before do
      get "/v1/artists/#{radiohead.id}"
    end

    it 'has OK status' do
      expect(response).to have_http_status(:ok)
    end

    it 'is JSON' do
      expect(response.content_type).to eq('application/json')
    end

    it 'is simple response' do
      expect(JSON.parse(body)).to eq('id' => radiohead.id, 'name' => radiohead.name, 'albums' => [])
    end
  end
end
