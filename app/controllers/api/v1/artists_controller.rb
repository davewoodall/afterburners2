# frozen_string_literal: true

class Api::V1::ArtistsController < ApplicationController
  def index
    @artists = Artist.and_albums
  end

  def show
    @artist = Artist.and_albums.find(params[:id])
  end

  def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
