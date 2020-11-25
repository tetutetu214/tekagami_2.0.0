class PrepsController < ApplicationController

  def index
    @preps = Prep.all
    @prep = Prep.new
  end

  def create
    @prep = Prep.new(prep_params)
    if @prep.valid?
      @prep.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def prep_params
    params.require(:prep).permit(:now, :target).merge(user_id: current_user.id)
  end

end
