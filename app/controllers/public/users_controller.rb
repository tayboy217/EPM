class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
      flash[:notice] = '更新が完了しました'
    else
      render :edit
      flash[:alert] = '更新ができませんでした'
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
