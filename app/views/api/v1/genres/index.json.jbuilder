# frozen_string_literal: true

json.array! @genres, partial: 'api/v1/genres/genre', as: :genre
