class FuneralsController < ApplicationController

  def show
    @funeral = Funeral.find(params[:funeral_id])
    @flower = @funeral.flower
    @funeral_home = @funeral.funeral_home
    @guest = @funeral.guest
    @venue = @funeral.venue
  end

  def my_funeral
    @funeral = Funeral.find_or_create_by(user_id: current_user.id)
    @flower = @funeral.flower
    @funeral_home = @funeral.funeral_home
    @guest = @funeral.guest
    @venue = @funeral.venue
    if @funeral.new_record?
      @funeral.save
    end
  end

  def new
    @funeral = Funeral.new
  end

  def create
    @funeral = Funeral.new(funeral_params)
    @funeral.user = current_user
    if @funeral.save
      redirect_to my_funeral_path(@funeral)
    else
      render :new
    end
  end

  def edit
    @funeral = Funeral.find(params[:id])
  end

  def update
    @funeral = Funeral.find(params[:id])
    @funeral.update(funeral_params)
    redirect_to my_funeral_path(@funeral)
  end

  def destroy
    @funeral = Funeral.find(params[:id])
    @funeral.destroy
    redirect_to my_funeral_path(@funeral)
  end

  private

  def funeral_params
    params.require(:funeral).permit(:user_id)
  end
end
