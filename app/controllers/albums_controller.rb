class AlbumsController < ApplicationController
  def index
    @all_albums = Album.all
  end

  def show
    @album = Album.find_by_id(params[:id])
  end

  def new
    @all_bands = Band.all
  end

  def create
    band = Band.find_by_id(params[:band][:id])
    album = band.albums.create!(params[:album])
    redirect_to album_url(album)
  end
end
