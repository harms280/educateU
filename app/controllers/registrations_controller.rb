class RegistrationsController < Devise::RegistrationsController
  
  private

  def sign_up_params
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:avatar,:about,:username)
  end

  def account_update_params
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:avatar,:about,:username,:current_password)
  end
end
