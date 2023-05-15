module Referrals
  module Callbacks
    extend ActiveSupport::Concern

    included do
      after_create :send_invitation
    end

    # send invitation email
    def send_invitation
      ReferralMailer.invite(self).deliver_now
    end
  end
end