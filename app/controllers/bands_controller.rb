class BandsController < ApplicationController
  def index
    @all_bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @band = Band.create!(params[:band])

    redirect_to band_url(@band)
  end

end
