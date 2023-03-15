class RelativesController < ApplicationController
  before_action :set_funeral, only: %i[show create new edit update destroy]
  before_action :set_user, only: %i[show create new edit update destroy]

  def new
    @relative = Relative.new
  end

  def show
    @relative = Relative.find(params[:id])
    @relative.funeral = @funeral
  end

  def create
    ids= params[:relative][:user_id]
    @users=User.where(id: ids)
    if @users
      @users.each do |user|
        @relative = Relative.new
        @relative.user = user
        @relative.funeral = @funeral
        @relative.save
        redirect_to userprofile_path(@user)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @relative = Relative.find(params[:id])
  end

  def update
    @relative = Relative.find(params[:id])
    if @relative.update_attributes(params[:relative])
      redirect_to @relative, :notice  => "Successfully updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @relative = Relative.find(params[:id])
    @relative.destroy
    redirect_to relatives_url, :notice => "Successfully erased."
  end

  private

  def relative_params
    params.require(:relative).permit(:email)
  end

  def set_funeral
    @funeral = Funeral.find(params[:funeral_id])
  end

  def set_user
    @user = User.find(params[:funeral_id])
  end
end
