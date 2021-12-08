class Public::NotesController < ApplicationController

  def new
     @note = Note.new
  end

  def remember
  end

  def complete

  end

  def done
     note = Note.find(params[:id])
     note.complete = true
     note.save
     redirect_to complete_index_notes_path
  end

  def forget
     note = Note.find(params[:id])
     note.complete = false
     note.save
     redirect_to remember_index_notes_path
  end

  def remember_index
    @notes = current_user.notes.where(complete: [false,nil])
  end

  def complete_index
     @notes = current_user.notes.where(complete: true)
  end

  def create
     @note = Note.new(note_params)
     @note.user_id = current_user.id
  if @note.save
     redirect_to remember_index_notes_path
  else
     render "public/homes/top"
  end
  end

  def edit
     @note = Note.find(params[:id])
  end

  def update
  end

  def destroy
     @note = Note.find(params[:id])
     @note.destroy
     redirect_to remember_index_notes_path
  end

  private
  def note_params
    params.require(:note).permit(:word, :japanese, :english)
  end

end
