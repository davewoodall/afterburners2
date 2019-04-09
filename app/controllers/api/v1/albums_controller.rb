# frozen_string_literal: true

class Api::V1::AlbumsController < ApplicationController
  before_action :set_album, only: %i[update destroy]

  def index
    @albums = Album.with_details
  end

  def show
    @album = Album.with_details.find(params[:id])
  end

  def create
    @album = AlbumFormService.new(album_params).call
    respond_to do |format|
      if @album.save
        format.json { render :show, status: :created, location: api_v1_albums_path(@album) }
      else
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.json { render :show, status: :ok, location: api_v1_albums_path(@album) }
      else
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    render json: {}, status: 204
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(
      :year,
      :name,
      genre_attributes: [:name],
      artist_attributes: [:name]
    )
  end
end
