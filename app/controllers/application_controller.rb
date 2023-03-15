class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user_funeral

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name surname avatar description address birthday background_picture])
  end

  def admin_destroy_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def default_url_options
    { host: ENV["http://www.take-care.me"] || "localhost:3000" }
  end

  private

  def set_current_user_funeral
    @current_user_funeral = Funeral.find_by(user: current_user) if current_user
  end
end
