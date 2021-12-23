class Admin::UsersController < ApplicationController
  def index
    @users = User.all.includes([:user])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

end
