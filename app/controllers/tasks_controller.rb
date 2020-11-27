class TasksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @prep = Prep.find(params[:prep_id])
    @task = Task.new
    @tasks = Task.includes([:user,:prep])
  end

  def create
    @prep = Prep.find(params[:prep_id])
    @task = Task.new(task_params)
    @tasks = Task.includes([:user,:prep])
    if @task.valid?
      @task.save
      redirect_to "/preps/#{@task.prep.id}/tasks"
    else
      render :index
    end
  end

  def edit
    @prep = Prep.find(params[:prep_id])
    @task = Task.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == @task.user_id
  end
  
  def update
    @prep = Prep.find(params[:prep_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
       redirect_to "/preps/#{@task.prep.id}/tasks"
    else
       render :edit
    end
  end

  def destroy
    @prep = Prep.find(params[:prep_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path(@task)
  end
  
  private

  def task_params 
    params.require(:task).permit(:task_1, :task_2,:task_3).merge(user_id: current_user.id ,prep_id: params[:prep_id])
  end


end
