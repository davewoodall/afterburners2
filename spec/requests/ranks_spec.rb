# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Ranks', type: :request do
  describe 'GET /v1/ranks/:rank' do
    describe 'by year' do
      before(:each) do
        create(:album)
        get '/v1/ranks/year'
      end

      it 'has OK status' do
        expect(response).to have_http_status(:ok)
      end

      it 'is JSON' do
        expect(response.content_type).to eq('application/json')
      end
    end

    describe 'by genre' do
      before do
        get '/v1/ranks/genre'
      end

      it 'has OK status' do
        expect(response).to have_http_status(:ok)
      end

      it 'is JSON' do
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
