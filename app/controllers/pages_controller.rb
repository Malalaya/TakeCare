class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_funeral, only: %i[my_funeral home]
  # ~before_action :set_relative, only: %i[home]

  def home
    if user_signed_in?
      @relatives = current_user.relatives
    else
      @relatives = []
    end
  end

  def my_profile
  end

  def user_profile
    @user = User.find(params[:id])
  end

  private

  def set_funeral
    @funeral = Funeral.all
  end

  # def set_relative
  #   @relatives = current_user.relatives.all
  # end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def set_flower
    @flower = Flower.find(params[:flower_id])
  end

  def set_funeral_home
    @funeral_home = FuneralHome.find(params[:funeral_home_id])
  end

  def set_guest
    @guest = Guest.find(params[:guest_id])
  end
end
