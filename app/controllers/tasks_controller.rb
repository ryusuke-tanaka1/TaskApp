class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks #ユーザーのタスクが全部入ってる
  end
  
  def new
    @user = User.find(params[:user_id])
    @task = @user.tasks.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.new(task_params) # 間違えてparams[task_params]にしない
    if @task.save
      redirect_to user_tasks_url
    else
      render :new
    end
  end
  
  
  private
    def task_params
      params.require(:task).permit(:name, :note, :user_id)
    end
end
