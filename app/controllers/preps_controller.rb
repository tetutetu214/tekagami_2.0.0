class PrepsController < ApplicationController
  before_action :authenticate_user!

  def index
    @prep = Prep.new
    @preps = Prep.includes(:user)
  end

  def create
    @preps = Prep.includes(:user)
    @prep = Prep.new(prep_params)
    if @prep.valid?
      @prep.save
      redirect_to preps_path(@prep)
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

  def prep_params
    params.require(:prep).permit(:now, :target).merge(user_id: current_user.id)
  end

end
