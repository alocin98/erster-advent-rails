class AddBackendFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :business_name
      t.text :address
      t.string :management_name
      t.string :phone
      t.string :category
      t.integer :package_plan
      t.string :otp
      t.boolean :is_verified, default: false, null: false
      t.datetime :otp_expiration_time
      t.string :payment_method
      t.string :legacy_password_hash
    end
  end
end
