class TasksController < ApplicationController
  def index
    @prep = Prep.find(params[:prep_id])
    @task = Task.new
  end

  def create
    @prep = Prep.find(params[:prep_id])
    @task = Task.new(task_params)
    if @task.valid?
      binding.pry
      @task.save
      redirect_to "/preps/#{@task.prep.id}"
    else
      render :index
    end
  end

  private

  def task_params 
    params.require(:task).permit(:task_1, :task_2,:task_3).merge(user_id: current_user.id ,prep_id: params[:prep_id])
  end


end
