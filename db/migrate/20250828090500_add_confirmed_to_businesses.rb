class AddConfirmedToBusinesses < ActiveRecord::Migration[8.0]
  def change
    add_column :businesses, :confirmed, :boolean, default: false, null: false
    add_index :businesses, :confirmed
  end
end
