class Public::TasksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @task = Task.new
    @tasks = current_user.tasks.where(complete: false).page(params[:page]).per(3).order('updated_at DESC')
  end

  def complete
    @tasks = current_user.tasks.where(complete: true).page(params[:page]).per(12).order('updated_at DESC')
  end

  def index
    @tasks = current_user.tasks.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @tasks = current_user.tasks.where(complete: false).page(params[:page]).per(3).order('updated_at DESC')
    @task.user_id = current_user.id
    if @task.save
      redirect_to new_task_path
      flash[:notice] = 'タスク投稿が完了しました'
    else
      render :new
      flash[:alert] = 'タスク投稿ができませんでした'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
      flash[:notice] = '更新が完了しました'
    else
      render :edit
      flash[:alert] = '更新ができませんでした'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.update(complete: true)
    redirect_to tasks_path
    flash[:notice] = 'タスク完了!!'
  end

  private

  def task_params
    params.require(:task).permit(:title, :starts_at, :ends_at)
  end
end
