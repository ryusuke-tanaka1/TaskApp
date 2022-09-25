class TasksController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  before_action :logged_in_user, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  before_action :correct_user, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  
  
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks.order(created_at: "DESC") #ユーザーのタスクが全部入ってる
  end
  
  def new
    @user = User.find(params[:user_id])
    @task = @user.tasks.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.new(task_params) # 間違えてparams[task_params]にしない
    if @task.save
      flash[:success] = "新規作成に成功しました。"
      redirect_to user_tasks_url
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end
  
  def update
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "更新に成功しました。"
      redirect_to user_tasks_url
    else
      render :edit
    end
  end
  
  def show
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @task.destroy
    flash[:success] = "削除しました。"
    redirect_to user_tasks_url
  end
  
  private
    def task_params
      params.require(:task).permit(:name, :note, :user_id)
    end
    def set_user
      @user = User.find(params[:user_id])
    end
end
