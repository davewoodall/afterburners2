# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_403_230_259) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'albums', force: :cascade do |t|
    t.bigint 'artist_id'
    t.string 'name', null: false
    t.integer 'year', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'genre_id'
    t.index ['artist_id'], name: 'index_albums_on_artist_id'
    t.index ['genre_id'], name: 'index_albums_on_genre_id'
    t.index ['name'], name: 'index_albums_on_name'
    t.index ['year'], name: 'index_albums_on_year'
  end

  create_table 'artists', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_artists_on_name'
  end

  create_table 'genres', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_genres_on_name'
  end

  add_foreign_key 'albums', 'artists'
  add_foreign_key 'albums', 'genres'
end
