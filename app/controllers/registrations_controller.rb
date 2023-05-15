class RegistrationsController < Devise::RegistrationsController
  before_action :set_referral_code, only: [:new]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    super do |resource|
      if resource.persisted? && session[:email]
        referral = Referral.pending.where(email: session[:email]).first
        if resource.verify_and_update_referral!(referral)
          session[:email] = nil
        end
      end
    end
  end

  private

  def set_referral_code
    session[:email] = params[:referral_email] if params[:referral_email].present?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end