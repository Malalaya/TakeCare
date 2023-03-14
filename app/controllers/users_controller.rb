class UsersController < ApplicationController
  before_action :authenticate_user!

  # def destroy
  #   @user = User.find(params[:id])
  #   if @user.destroy
  #     flash[:success] = "Account successfully deleted."
  #     redirect_to root_path
  #   else
  #     flash[:error] = "Account could not be deleted."
  #     redirect_to user_path(@user)
  #   end
  # end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = current_user
    if @user.destroy
      sign_out @user
      redirect_to root_path, notice: "Your account has been deleted."
    else
      redirect_to root_path, notice: "Your account could not be deleted."
    end
  end
end
