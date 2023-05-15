class CreateReferrals < ActiveRecord::Migration[7.0]
  def change
    create_table :referrals do |t|
      t.string :email, index: true
      t.integer :status, default: 0
      t.integer :resend_count, default: 0
      t.references :user, null: false, index: true

      t.timestamps
    end
  end
end
