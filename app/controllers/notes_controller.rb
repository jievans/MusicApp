class NotesController < ApplicationController
  skip_before_filter :authorized, :only => [:destroy]

  def create
    note = Note.create!(params[:note])
    redirect_to track_url(note.track_id)
  end

  def destroy
    note = Note.find_by_id(params[:id])

    unless @current_user.is_admin || current_user.id == note.user_id
      flash[:notices] ||= []
      flash[:notices] << "You aren't allowed to delete that."
      redirect_to :back
    else
      track = note.track
      note.destroy
      redirect_to track_url(track)
    end

  end
end
