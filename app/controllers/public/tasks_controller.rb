class Public::TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index
  end

  def show
  end

  def create
     @task = Task.new(task_params)
     @task.user_id = current_user.id
  if @task.save
     redirect_to new_task_path
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
  def task_params
    params.require(:task).permit(:body, :post_date)
  end

end
