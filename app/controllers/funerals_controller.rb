class FuneralsController < ApplicationController
  def show
    @funeral = Funeral.find(params[:id])
  end

  private

  def funeral_params
    params.require(:funeral).permit(:user_id)
  end
end
