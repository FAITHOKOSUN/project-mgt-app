class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
    @task = Task.find(params[:id])
    @user = @task.user
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to task_url(@task), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to task_url(@task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :description, :name, :image_file)
  end
end
