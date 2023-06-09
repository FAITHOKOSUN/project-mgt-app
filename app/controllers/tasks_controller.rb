class TasksController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
   
  end

  # GET /tasks/1 or /tasks/1.json
  def show
      @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.new
  end

  # GET /tasks/1/edit
 def edit
  @task = Task.find(params[:id])

end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.new(task_params)
      if @task.save
        redirect_to task_url(@task), notice: "Task was successfully created." 
      else
        render :new
      end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @task = current_user.tasks.find(params[:id])
          if @task.update(task_params)
         redirect_to task_url(@task), notice: "Task was successfully updated."
      else
        render :edit
      end
  end
  

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
      redirect_to tasks_url, notice: "Task was successfully destroyed."
     
  end

  private
  
    def task_params
      params.require(:task).permit(:user_id, :description, :name, :image_file)
    end
end
