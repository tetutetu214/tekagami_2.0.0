class ActivesController < ApplicationController
  before_action :authenticate_user!
  
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
    if @active.valid?
      @active.save
      redirect_to "/preps/#{@active.prep.id}/tasks/#{@active.task.id}/actives"
    else
      render :index
    end
  end

  def edit
    @prep = Prep.find(params[:prep_id]) 
    @task = Task.find(params[:task_id]) 
    @active = Active.find(params[:id]) 
    redirect_to action: :index unless user_signed_in? && current_user.id == @prep.user_id
  end

  def update
    @prep = Prep.find(params[:prep_id]) 
    @task = Task.find(params[:task_id]) 
    @active = Active.find(params[:id]) 
    if @active.update(active_params)
       redirect_to prep_task_actives_path(@prep.id,@task.id,@active)
    else
       render :edit
    end
  end

  def destroy
    active = Active.find(params[:id])
    active.destroy
    redirect_to preps_path
  end
  
  private

  def active_params 
    params.require(:active).permit(:way_1, :way_2,:way_3).merge(user_id: current_user.id ,prep_id: params[:prep_id],task_id: params[:task_id])
  end

end
