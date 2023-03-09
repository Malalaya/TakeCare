class GuestsController < ApplicationController
  before_action :set_funeral, only: %i[index new create]

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.funeral = @funeral
    if @guest.save
      redirect_to my_funeral_path(@funeral)
    else
      render :new
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    @guest.update(guest_params)
    redirect_to my_funeral_path(@funeral)
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to my_funeral_path(@funeral)
  end

  private

  def guest_params
    params.require(:guest).permit(:guest_list, :funeral_id)
  end

  def set_funeral
    @funeral = Funeral.find(params[:funeral_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
