class NotesController < ApplicationController
  def create
    note = Note.create!(params[:note])
    redirect_to track_url(note.track_id)
  end

  def destroy
    note = Note.find_by_id(params[:id])
    track = note.track
    note.destroy

    redirect_to track_url(track)
  end
end
