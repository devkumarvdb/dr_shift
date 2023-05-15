class Referral < ApplicationRecord
  include Referrals::Validations, Referrals::Relations, Referrals::Callbacks

  enum status: [:pending, :accepted, :expired]
  
  MAX_RESEND_COUNT = 5

  # send invitation email
  def resend!
    return if self.resend_limit_reached?

    self.increment!(:resend_count)
    self.send_invitation
  end

  # check if resend limit is reached
  def resend_limit_reached?
    self.resend_count >= MAX_RESEND_COUNT
  end

end