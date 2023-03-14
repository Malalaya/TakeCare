class FuneralFlowersController < ApplicationController

  before_action :set_funeral
  before_action :set_user

  # def show
  #   @funeral_flower = FuneralFlower.find(params[:id])
  # end

  def new
    @funeral_flower = FuneralFlower.new
  end

  def create
    @funeral_flower = FuneralFlower.new(funeral_flower_params)
    @funeral_flower.funeral = @funeral
    if @funeral_flower.save
      redirect_to funeral_path(@user.funerals.first)
    else
      render :new
    end
  end

  def edit
    @funeral_flower = FuneralFlower.find(params[:id])
  end

  def update
    @funeral_flower = FuneralFlower.find(params[:id])
    if @funeral_flower.update(funeral_flower_params)
      redirect_to funeral_path(@user.funerals.first)
    else
      render :edit
    end
  end

  private

  def funeral_flower_params
    params.require(:funeral_flower).permit(:funeral_id, :flower_id)
  end

  def set_funeral
    @funeral = Funeral.find(params[:funeral_id])
  end

  def set_user
    @user = User.find(params[:funeral_id])
  end

end
