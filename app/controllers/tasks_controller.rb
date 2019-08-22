class TasksController < ApplicationController
  #before_action :set_user, only: [:destroy]
  before_action :set_task, only: [:edit, :show, :update, :destroy]
  #before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info, :edit_basic_all, :update_basic_all]
  before_action :logged_in_user, only: [:index, :edit]
  #before_action :correct_user, only: [:index, :edit]
  #before_action :admin_or_correct_user, only: [:show, :index]

  def top
  end
  
  def new
    #@user = User.find(params[:user_id])
    #@user.task.build
    @task = Task.new
  end
  
  def index
    #@tasks = Task.all.order(created_at: :desc.)
    #debugger
    #@user = User.find(params[:user_id])
    #@task = @user.tasks
    #@tasks = Task.where(user_id: params[:user_id]).order(created_at: :desc)
    @user = User.find(params[:user_id])
    #@task = @user.tasks
  end

  def show
    #@task = Task.find(params[:id])
  end

  def edit
    #@task = Task.find(params[:id])
  end

  def create
    #@task = Task.new
    @task = Task.new(task_params)
    # @task =　@task.new(user_id: params[:user_id])
    #@task = @task.task.build(task_params)
    @task.user_id = current_user.id
    #@task.name = params[:name]
    #@task.description = params[:description]
    #debugger
    if @task.save
      #@task.update_attributes(user_id: params[:user_id])
      #debugger
      flash[:success] = "タスクを新規作成しました！"
      redirect_to user_tasks_path(current_user)
    elsif
      flash[:danger] = "タスクの登録に失敗しました！"
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
