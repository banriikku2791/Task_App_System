class TasksController < ApplicationController

  before_action :set_users, only: [:new, :index, :edit, :show, :update, :create, :destroy]
  before_action :logged_in_user, only: [:new, :index, :edit, :show, :update, :create, :destroy]
  before_action :correct_user, only: [:new, :index, :edit, :show, :update, :create, :destroy]
  before_action :set_task, only: [:edit, :show, :update, :destroy]
  before_action :set_tasks, only: [:index]

  def top
  end
  
  def new
    @task = Task.new
  end
  
  def index
  end

  def show
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      flash[:success] = "タスクを新規作成しました！"
      redirect_to user_tasks_path(current_user)
    elsif
      render :new
    end
  end    

  def update
    if @task.update_attributes(task_params_up)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_path(current_user,@task)
    else
      render :edit      
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_path(current_user)
  end

  private

    def task_params
      params.require(:task).permit(:name, :description, :user_id)
    end

    def task_params_up
      params.require(:task).permit(:name, :description)
    end

end
