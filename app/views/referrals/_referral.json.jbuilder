json.extract! referral, :id, :email, :status, :resend_count, :token, :user_id, :created_at, :updated_at
json.url referral_url(referral, format: :json)
