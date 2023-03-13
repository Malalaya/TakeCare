require 'uri'
require 'net/http'
require 'openssl'

class FlowersController < ApplicationController
  before_action :set_funeral, only: %i[new create edit update show destroy]
  before_action :set_user, only: %i[create edit update show destroy]

  # def findflowers
  #   url = URI("https://plants2.p.rapidapi.com/api/plants?")

  #   http = Net::HTTP.new(url.host, url.port)
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  #   request = Net::HTTP::Get.new(url)
  #   request["Authorization"] = 'GKZOHNZj0xP65kk0BAE2Tl9LGagm0pfD3DFNxAEEZcMQBhRZVDco8vbNJdnwwCo0'
  #   request["X-RapidAPI-Key"] = ENV['X-RAPIDAPI_KEY']
  #   request["X-RapidAPI-Host"] = 'plants2.p.rapidapi.com'

  #   response = http.request(request)
  #   puts response.read_body
  # end

  def new
    @flower = FuneralFlower.new
  end

  def create
    @funeral_flower = FuneralFlower.new(funeral_flower_params)
    @funeral_flower.funeral = @funeral
    @funeral_flower.flower = Flower.find(params[:flower_id])
    if @funeral_flower.save
      redirect_to my_funeral_path(@funeral)
    else
      render :new
    end
  end

  def show
    @flower = @funeral.flower
  end

  def edit
    @flower = Flower.find(params[:funeral_id])
  end

  def update
    @flower = Flower.find(params[:id])
    @funeral.flower.update(flower_params)
    redirect_to my_funeral_path(@funeral)
  end

  def destroy
    @flower = Flower.find(params[:id])
    @flower.destroy
    redirect_to my_funeral_path(@funeral)
  end

  private

  def set_user
    @user = current_user
  end

  def flower_params
    params.require(:flower).permit(:name, :flower_id, :funeral_id)
  end

  def funeral_flower_params
    params.require(:funeral_flower).permit(:funeral_id, :flower_id)
  end


  def set_funeral
    @funeral = Funeral.find(params[:funeral_id])
  end
end
