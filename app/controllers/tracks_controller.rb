class TracksController < ApplicationController
  def index
    @all_tracks = Track.all
  end

  def show
    @track = Track.find_by_id(params[:id])
    render :show
  end

  def new
    @all_albums = Album.all
    @track = Track.new
    render :new
  end

  def create
    album = Album.find_by_id(params[:album][:id])
    track = album.tracks.create!(params[:track])

    redirect_to track_url(track)
  end

  def edit
    @all_albums = Album.all
    @track = Track.find_by_id(params[:id])
    render :edit
  end

  def update
    params[:track][:album_id] = params[:album][:id]
    track = Track.find_by_id(params[:id])
    track.update_attributes!(params[:track])

    redirect_to track_url(track)
  end

  def destroy
    track = Track.find_by_id(params[:id])
    album = track.album
    track.destroy
    flash[:notices] ||= []
    flash[:notices] << "Track removed"

    redirect_to album_url(album)
  end


end
