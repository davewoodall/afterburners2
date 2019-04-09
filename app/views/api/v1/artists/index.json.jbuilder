# frozen_string_literal: true

json.array! @artists, partial: 'api/v1/artists/artist', as: :artist
