class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # beforフィルター

  # paramsハッシュからユーザーを取得します。
  def set_user
    @user = User.find(params[:id])
  end
  
  # paramsハッシュからユーザーを取得します。
  def set_users
    @user = User.find(params[:user_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_tasks
    @task = Task.find(params[:user_id])
  end

  # ログイン済みのユーザーか確認します。
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    unless current_user?(@user)
      flash[:danger] = "他者の参照および編集権限がありません。"
      redirect_to(root_url)
    end  
  end

  # システム管理権限所有かどうか判定します。
  def admin_user
    unless current_user.admin?
      flash[:danger] = "参照および編集権限がありません。"
      redirect_to(root_url)
    end     
  end

end
