class ReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @prep = Prep.find(params[:prep_id])
    @task = Task.find(params[:task_id]) 
    @active = Active.find(params[:active_id])
    @review = Review.new
    @reviews = Review.includes([:user,:prep,:task,:active])
  end

  def create
    @prep = Prep.find(params[:prep_id])
    @task = Task.find(params[:task_id])
    @active = Active.find(params[:active_id])
    @review = Review.new(review_params)
    @reviews = Review.includes([:user,:prep,:task,:active])
    if @review.valid?
      @review.save
      redirect_to "/preps/#{@review.prep.id}/tasks/#{@review.task.id}/actives/#{@review.active.id}/reviews"
    else
      render :index
    end
  end

  def edit
    @prep = Prep.find(params[:id]) 
    redirect_to action: :index unless user_signed_in? && current_user.id == @prep.user_id
  end

  def update
    @prep = Prep.find(params[:id])
    if @prep.update(prep_params)
       redirect_to preps_path(@prep)
    else
       render :edit
    end
  end

  def destroy
    prep = Prep.find(params[:id])
    prep.destroy
    redirect_to preps_path(@prep)
  end
  
  private

  def review_params
    params.require(:review).permit(:rev_1, :rev_2,:rev_3,:rev_4).merge(user_id: current_user.id ,prep_id: params[:prep_id],task_id: params[:task_id],active_id: params[:active_id])
  end

end
