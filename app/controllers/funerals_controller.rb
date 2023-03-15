class FuneralsController < ApplicationController
  before_action :everything, only: [:show, :documents, :my_funeral, :edit, :update, :destroy]

  def show
    @active = :funeral

    @venue_markers = [{
      lat: @venue.latitude,
      lng: @venue.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {venue: @venue}),
      marker_html: render_to_string(partial: "marker", locals: {venue: @venue}),
    }] if @venue&.geocoded?
    @funeral_home_markers = [{
      lat: @funeral_home.latitude,
      lng: @funeral_home.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {funeral_home: @funeral_home}),
      marker_html: render_to_string(partial: "marker", locals: {funeral_home: @funeral_home}),
    }] if @funeral_home&.geocoded?
  end

  def documents
    @active = :documents
  end

  def informal_will
  end

  def my_funeral
    @funeral = Funeral.find_or_create_by(user_id: current_user.id)
    @flower = @funeral.funeral_flower
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
      redirect_to funeral_path(@user.funerals.first)
    else
      render :new
    end
  end

  def edit
    @funeral = Funeral.find(params[:id])
  end

  def update
    @funeral = Funeral.find(params[:id])

    if @funeral.update(funeral_params)
      redirect_to funeral_path(@funeral), notice: 'That was successful!'
    else
      render :edit
    end
  end

  def destroy
    @funeral = Funeral.find(params[:id])
    @funeral.destroy
    redirect_to my_funeral_path(@funeral)
  end

  private

  def everything
    @funeral = Funeral.find(params[:id])
    @flower = @funeral.funeral_flower
    @funeral_home = @funeral.funeral_home
    @guest = @funeral.guest
    @venue = @funeral.venue
    @user = @funeral.user
  end


  def funeral_params
    params.require(:funeral).permit(:user_id, documents: [])
  end
end
