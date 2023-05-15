class ApplicationController < ActionController::Base
  
  protected

  # Redirect referral user to the user edit page after sign in
  # root_path for normal user
  def after_sign_in_path_for(resource)
    if resource.has_role?(:referral)
      user_path(resource)
    else
      root_path
    end
  end
end
