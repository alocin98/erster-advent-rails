class AddDeletedToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :deleted, :boolean, default: false, null: false
    add_index :users, :deleted
  end
end
