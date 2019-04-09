# frozen_string_literal: true

class AlbumFormService
  def initialize(params)
    @album = params
    @artist_name = params['artist_attributes']['name']
    @genre_name = params['genre_attributes']['name']
  end

  def call
    find_or_create_album
  end

  private

  def find_or_create_album
    Album.find_or_create_by(
      name: @album['name'],
      year: @album['year'],
      artist: artist,
      genre: genre
    )
  end

  def artist
    Artist.find_or_create_by(name: @artist_name) if @artist_name
  end

  def genre
    Genre.find_or_create_by(name: @genre_name) if @genre_name
  end
end
