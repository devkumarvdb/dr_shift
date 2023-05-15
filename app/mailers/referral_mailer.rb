class ReferralMailer < ApplicationMailer
  def invite(referral)
    @referral = referral

    mail(to: @referral.email, subject: 'Invitation to join our platform')
  end
end
