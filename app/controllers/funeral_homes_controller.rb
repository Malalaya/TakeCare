class FuneralHomesController < ApplicationController
  before_action :set_funeral, only: [:new, :create, :edit, :update, :destroy]

  def new
    @funeral_home = FuneralHome.new
  end

  def create
    @funeral_home = FuneralHome.new(funeral_home_params)
    if @funeral_home.save
      redirect_to my_funeral_path(@funeral)
    else
      render :new
    end
  end

  def edit
    @funeral_home = FuneralHome.find(params[:id])
  end

  def update
    @funeral_home = FuneralHome.find(params[:id])
    @funeral_home.update(funeral_home_params)
    redirect_to my_funeral_path(@funeral)
  end

  # def edit
  #   @funeral_home = @funeral.funeral_home
  # end

  # def update
  #   @funeral_home = @funeral.funeral_home
  #   if @funeral_home.update(funeral_home_params)
  #     redirect_to my_funeral_path(@funeral)
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @funeral_home = FuneralHome.find(params[:id])
    @funeral_home.destroy
    redirect_to my_funeral_path(@funeral)
  end

  private

  def funeral_home_params
    params.require(:funeral_home).permit(:name, :address, :funeral_id)
  end

  def set_funeral
    @funeral = Funeral.find(params[:funeral_id])
  end
end
