# frozen_string_literal: true

json.array! @albums, partial: 'api/v1/albums/album', as: :album
