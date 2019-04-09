# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    name { Faker::Music.album }
    year { rand(1999..Time.new.year).to_i }

    before(:create)  do |album|
      album.artist = create(:artist)
      album.genre = create(:genre)
    end
  end
end
