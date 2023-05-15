class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @referrals = current_user.referrals
    
    render :index
  end

end