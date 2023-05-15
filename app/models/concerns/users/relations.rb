module Users
  module Relations
    extend ActiveSupport::Concern

    included do
      has_many :referrals, dependent: :destroy
      has_many :referred_users, class_name: 'User', foreign_key: :referred_by_id
      
      belongs_to :referrer, class_name: 'User', optional: true, foreign_key: :referred_by_id
    end
  end
end