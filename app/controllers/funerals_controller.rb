class FuneralsController < ApplicationController

  def show
    @funeral = Funeral.find(params[:id])
  end

  def my_funeral
    @funeral = Funeral.find_or_create_by(user_id: current_user.id)
  end

  private

  def funeral_params
    params.require(:funeral).permit(:user_id)
  end
end
