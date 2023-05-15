module Referrals
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :email, presence: true, uniqueness: true
    end

  end
end