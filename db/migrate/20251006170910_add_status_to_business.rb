class AddStatusToBusiness < ActiveRecord::Migration[8.0]
  def change
    add_column :businesses, :status, :integer, default: 0
    add_index :businesses, :status
  end
end
