class ReviewsController < ApplicationController
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

  private

  def review_params
    params.require(:review).permit(:rev_1, :rev_2,:rev_3,:rev_4).merge(user_id: current_user.id ,prep_id: params[:prep_id],task_id: params[:task_id],active_id: params[:active_id])
  end

end
