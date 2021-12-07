class Public::NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def remember
  end

  def complete
  end

  def remember_index
    @notes = Note.all
  end

  def complete_index
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
  if @note.save
    redirect_to remember_index_notes_path(@note)
  else
    render "public/homes/top"
  end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def note_params
    params.require(:note).permit(:word, :japanese, :english)
  end

end
