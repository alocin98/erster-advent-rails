class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :payment_image, null: false
      t.string :payment_session_id
      t.string :customer_email
      t.string :plan
      t.string :is_verified, null: false, default: "Pending"

      t.timestamps
    end
  end
end
