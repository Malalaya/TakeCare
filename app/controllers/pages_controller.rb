class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def my_profile
  end

  def user_profile
    @user = User.find(params[:id])
  end
end
