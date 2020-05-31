class ApplicationController < ActionController::Base
	# before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :user_logged_in?

  # def user_logged_in?
  #   if session[:user_id]
  #     begin
  #       @current_user = User.find_by(user_id: session[:user_id])
  #     rescue ActiveRecord::RecordNotFound
  #       reset_user_session
  #     end
  #   end
  #   return if @current_user
  #   # @current_userが取得できなかった場合はログイン画面にリダイレクト
  #   flash[:referer] = request.fullpath
  #   redirect_to login_index_path
  # end
  
  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end
  # def after_sign_in_path_for(resource)
  # 	user_path
  # end
  def after_sign_in_path_for(resource)
    flash[:notice] = 'Welcome! You have signed in successfully.'
    user_path(current_user.id)
  end

  # def after_sign_up_path_for(resource)
  #   flash[:notice] = 'Welcome! You have signed up successfully.'
  #   user_path(current_user.id)
  # end

  # def after_sign_out_path_for(resource)
  #   flash[:notice] = 'You have signed in successfully.'
  #   root_path
  # end
  def after_sign_out_path_for(resource)
    flash[:notice] = 'Signed out successfully.'
    root_path
  end



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end	
end
