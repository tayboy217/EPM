class Public::NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def remember
    @note = Note.find(params[:id])
  end

  def complete
    @note = Note.find(params[:id])
  end

  def done
    note = Note.find(params[:id])
    note.complete = true
    note.save
    redirect_to complete_index_notes_path
    flash[:notice] = 'その調子で頑張ろう!!'
  end

  def forget
    note = Note.find(params[:id])
    note.complete = false
    note.save
    redirect_to remember_index_notes_path
    flash[:notice] = '引き続き頑張ろう!!'
  end

  def remember_index
    @notes = current_user.notes.where(complete: [false, nil]).page(params[:page]).per(12).order('updated_at DESC')
  end

  def complete_index
    @notes = current_user.notes.where(complete: true).page(params[:page]).per(12).order('updated_at DESC')
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to remember_index_notes_path
       flash[:notice] = '投稿が完了しました'
    else
      render "public/homes/top"
       flash[:alert] = '投稿ができませんでした'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to remember_index_notes_path
       flash[:notice] = '更新が完了しました'
    else
      render :edit
      flash[:alert] = '更新できませんでした'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to remember_index_notes_path
    flash[:notice] = '削除しました'
  end

  def search
    @notes = current_user.notes.all.page(params[:page]).per(10).order('updated_at DESC')
  end 

  private

  def note_params
    params.require(:note).permit(:word, :japanese, :english)
  end
end
