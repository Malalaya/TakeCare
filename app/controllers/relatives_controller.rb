class RelativesController < ApplicationController

#before_action :set_funeral, only: %i[show create new edit update destroy]

  def new
    @relative = Relative.new
  end

  def create
    @relative = Relative.new(relative_params)
    @relative.funeral = @funeral
    @relative.user = current_user
    if @relative.save
      redirect_to "/", :notice => "Successfully created relative."
    else
      render :action => 'new'
    end
  end

  def edit
    @relative = Relative.find(params[:id])
  end

  def update
    @relative = Relative.find(params[:id])
    if @relative.update_attributes(params[:relative])
      redirect_to @relative, :notice  => "Successfully updated relative."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @relative = Relative.find(params[:id])
    @relative.destroy
    redirect_to relatives_url, :notice => "Successfully destroyed relative."
  end

  private

  def relative_params
    params.require(:relative).permit(:email)
  end

  def set_funeral
    @funeral = Funeral.find(params[:funeral_id])
  end
end
