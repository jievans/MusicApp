class AlbumsController < ApplicationController

  def index
    @all_albums = Album.all
  end

  def create
    band = Band.find_by_id(params[:band][:id])
    album = band.albums.create!(params[:album])
    redirect_to album_url(album)
  end

  def destroy
    album = Album.find_by_id(params[:id])
    band = album.band
    album.destroy
    flash[:notices] ||= []
    flash[:notices] << "Album removed"

    redirect_to band_url(band)
  end

  def edit
    @album = Album.find_by_id(params[:id])
    @all_bands = Band.all
  end

  def new
    @all_bands = Band.all
    @album = Album.new
  end

  def show
    @album = Album.find_by_id(params[:id])
  end

  def update
    params[:album][:band_id] = params[:band][:id]
    album = Album.find_by_id(params[:id])
    album.update_attributes!(params[:album])

    redirect_to album_url(album)
  end
end
