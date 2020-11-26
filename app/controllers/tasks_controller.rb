class TasksController < ApplicationController
  def index
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      @task.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_1, :task_2,:task_3).merge(user_id: current_user.id ,prep_id: params[:prep_id])
  end

end
