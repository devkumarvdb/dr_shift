class ReferralsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_referral, only: %i[ resend ]

  # GET /referrals/new
  def new
    @referral = current_user.referrals.new
  end

  # POST /referrals or /referrals.json
  def create
    @referral = current_user.referrals.new(referral_params)

    respond_to do |format|
      if @referral.save
        format.html { redirect_to root_url(@referral), notice: "Referral was successfully created." }
        format.json { render :show, status: :created, location: @referral }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  def resend
    if @referral.resend_limit_reached?
      notice = "You have reached the maximum number of resend attempts to #{@referral.email}."
    else
      @referral.resend!
      notice = "Referral email was successfully resent."
    end
    redirect_to root_url, notice: notice
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral
      @referral = Referral.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def referral_params
      params.require(:referral).permit(:email)
    end
end
