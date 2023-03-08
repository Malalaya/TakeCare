class VenuesController < ApplicationController
  before_action :set_funeral, only: [:new, :create, :edit, :update, :destroy]
  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to my_funeral_path(@funeral)
    else
      render :new
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to my_funeral_path(@funeral)
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to funeral_path(@funeral)
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :funeral_id)
  end

  def set_funeral
    @funeral = Funeral.find(params[:funeral_id])
  end
end
