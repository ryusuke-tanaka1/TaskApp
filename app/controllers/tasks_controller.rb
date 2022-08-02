class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks #ユーザーのタスクが全部入ってる
  end
  
  def new
    @user = User.find(params[:user_id])
    @task = @user.tasks
  end
end
