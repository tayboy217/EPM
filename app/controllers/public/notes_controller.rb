class Public::NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
  if @note.save
    redirect_to note_path(@note)
  else
    render :new
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
