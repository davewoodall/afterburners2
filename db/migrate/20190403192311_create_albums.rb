# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.references :artist, foreign_key: true
      t.string :name, null: false, index: true
      t.integer :year, null: false, index: true
      t.timestamps
    end
  end
end
