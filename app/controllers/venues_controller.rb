class VenuesController < ApplicationController
  before_action :set_funeral, only: %i[index show new create edit update destroy]


  def index
    @venues = Venue.all
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {venue: venue}),
        marker_html: render_to_string(partial: "marker", locals: {venue: venue})
      }
    end
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.funeral = @funeral
    if @venue.save
      redirect_to funeral_path(@user.funerals.first)
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
    redirect_to funeral_path(@user.funerals.first)
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

  def set_user
    @user = User.find(params[:funeral_id])
  end
end
