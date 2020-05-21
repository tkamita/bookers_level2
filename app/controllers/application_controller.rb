class ApplicationController < ActionController::Base
	# before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  # 	user_path
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end	
end



  # def after_sign_in_path_for(resource)
  #   mypage_root_path # ログイン後に遷移するpathを設定
  # end