class Admin::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10).order('updated_at DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end
end
