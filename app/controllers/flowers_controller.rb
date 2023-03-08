class FlowersController < ApplicationController
  before_action :set_funeral, only: [:new, :create, :edit, :update, :destroy]

  def new
    @flower = Flower.new
    @funeral = Funeral.find(params[:funeral_id])
  end

  def create
    @flower = Flower.new(flower_params)
    @flower.funeral = @funeral
    if @flower.save
      redirect_to my_funeral_path(@funeral)
    else
      render :new
    end
  end

  def edit
    @flower = Flower.find(params[:id])
  end

  def update
    @flower = Flower.find(params[:id])
    @flower.update(flower_params)
    redirect_to my_funeral_path(@funeral)
  end

  def destroy
    @flower = Flower.find(params[:id])
    @flower.destroy
    redirect_to my_funeral_path(@funeral)
  end

  private

  def flower_params
    params.require(:flower).permit(:name, :funeral_id)
  end

  def set_funeral
    @funeral = Funeral.find(params[:funeral_id])
  end
end
