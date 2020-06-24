class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do
        # resource.update(confirmed_at: Time .now.utc)
        UserNotifierMailer.send_signup_email(@user).deliver
    end
  end
end

