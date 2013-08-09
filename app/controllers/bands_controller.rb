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
    @band = Band.new
    render :new
  end

  def create
    @band = Band.create!(params[:band])
    redirect_to band_url(@band)
  end

  def edit
    @band = Band.find_by_id(params[:id])
    render :edit
  end

  def update
    band = Band.find_by_id(params[:id])
    band.update_attributes!(params[:band])

    redirect_to band_url(band)
  end

  def destroy
    band = Band.find_by_id(params[:id])
    band.destroy
    flash[:notices] ||= []
    flash[:notices] << "Band removed"

    redirect_to bands_url
  end

end
