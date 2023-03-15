class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user_funeral
  # before_action :store_user_location!, if: :storable_location?

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
 
  def user_route_path
    userprofile_path(current_user)
  end

  def after_update_path_for(resource_or_scope)
    user_path(resource_or_scope)
  end

  private

  def set_current_user_funeral
    @current_user_funeral = Funeral.find_by(user: current_user) if current_user
  end

  # def storable_location?
  #   request.get? &&
  #     is_navigational_format? &&
  #     !devise_controller? &&
  #     !request.xhr? &&
  #     !turbo_frame_request?
  # end

  # def store_user_location!
  #   store_location_for(:user, request.fullpath)
  # end

  # def store_action
  #   return unless request.get?
  #   if (request.path != "/users/sign_in" &&
  #       request.path != "/users/sign_up" &&
  #       request.path != "/users/password/new" &&
  #       request.path != "/users/password/edit" &&
  #       request.path != "/users/confirmation" &&
  #       request.path != "/users/sign_out" &&
  #       request.path != "/users/edit" &&
  #       !request.xhr?) # don't store ajax calls
  #     store_location_for(:user, request.fullpath)
  #   end
  # end
end
