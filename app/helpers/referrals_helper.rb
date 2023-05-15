module ReferralsHelper

  # show resend link if referral is pending and resend limit is not reached
  def show_resend_referral_link?(referral)
    referral.pending?
  end

end
