class FuneralsController < ApplicationController

  def index
    @funerals = Funeral.all
  end

  def show
    @funeral = Funeral.find(params[:id])
  end

  def new
    @funeral = Funeral.new
  end

  def create
    @funeral = Funeral.new(funeral_params)
    @funeral.user = current_user
    if @funeral.save
      redirect_to funeral_path(@funeral)
    else
      render :new
    end
  end

  private

  def funeral_params
    params.require(:funeral).permit(:user_id)
  end
end
