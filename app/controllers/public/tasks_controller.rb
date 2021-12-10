class Public::TasksController < ApplicationController

  def new
  end

  def index
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def task_params
    params.require(:note).permit(:body, :post_date)
  end

end
