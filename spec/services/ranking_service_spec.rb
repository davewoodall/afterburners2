# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RankingService, type: :service do
  let(:params) { { 'rank' => 'year', 'order' => 'desc' } }
  subject { RankingService }

  it 'ranks by attribute' do
    expect(subject.new(params).rank).to eq('year')
  end

  describe 'rank by year' do
    before(:each) do
      allow(Album).to receive(:count_by).and_return(year_payload)
    end

    it 'order defaulst to desc' do
      expect(subject.new(params).order).to eq('desc')
    end

    it 'desc order' do
      expect(subject.new(params).sort_rank).to eq(sorted_by_year_desc)
    end

    it 'asc order' do
      params = { 'rank' => 'year', 'order' => 'asc' }
      expect(subject.new(params).sort_rank).to eq(sorted_by_year_asc)
    end
  end

  describe 'rank by genre' do
    before(:each) do
      allow(Album).to receive(:count_by).and_return(genre_payload)
    end

    it 'desc order' do
      expect(subject.new('rank' => 'genre').sort_rank).to eq(sorted_by_genre_desc)
    end

    it 'asc order' do
      params = { 'rank' => 'genre', 'order' => 'asc' }
      expect(subject.new(params).sort_rank).to eq(sorted_by_genre_asc)
    end
  end
end
