class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    fail
  end

  def update

  end

  def destroy

  end

  private


  def note_params
    params.require(:note).permit(:title, :text, :track_id, :user_id)
  end


end
