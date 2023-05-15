class User < ApplicationRecord
  include Users::Relations
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # This method is used to verify the referral code and update the user's referral status.
  def verify_and_update_referral!(referral)
    if referral.present?
      self.referrer = referral.user 
      self.add_role(:referral)
    end

    if self.save
      referral.accepted!
    end
  end
end