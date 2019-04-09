# frozen_string_literal: true

json.extract! album,
              :id,
              :name,
              :year
json.artist album.artist.name
json.genre album.genre.name
