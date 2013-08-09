class TracksController < ApplicationController
  def index
  end

  def show
    @track = Track.find_by_id(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
  end

end
