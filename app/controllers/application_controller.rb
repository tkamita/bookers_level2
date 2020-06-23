class ApplicationController < ActionController::Base
	# before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :user_logged_in?
  
  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end
  def after_sign_in_path_for(resource)
    flash[:notice] = 'Welcome! You have signed in successfully.'
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = 'Signed out successfully.'
    root_path
  end



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :address])
  end	
end
