# frozen_string_literal: true

class AddGenreToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_reference :albums, :genre, index: true, foreign_key: true
  end
end
