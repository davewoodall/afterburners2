# frozen_string_literal: true

json.extract! artist, :id, :name
json.albums artist.albums, :name, :year
