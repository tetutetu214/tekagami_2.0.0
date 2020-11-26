class ActivesController < ApplicationController
  def index
    @prep = Prep.find(params[:prep_id])
    @task = Task.find(params[:task_id]) 
    @active = Active.new
    @actives = Active.includes([:user,:prep,:task])
  end

  def create
    @prep = Prep.find(params[:prep_id])
    @task = Task.find(params[:task_id])
    @active = Active.new(active_params)
    @actives = Active.includes([:user,:prep,:task])
    binding.pry
    if @active.valid?
      @active.save
      redirect_to "/preps/#{@active.prep.id}/tasks/#{@active.task.id}/actives"
    else
      render :index
    end
  end

  private

  def active_params 
    params.require(:active).permit(:way_1, :way_2,:way_3).merge(user_id: current_user.id ,prep_id: params[:prep_id],task_id: params[:task_id])
  end

end
