class AddCategoriesToBusinesses < ActiveRecord::Migration[8.0]
  def change
    add_column :businesses, :categories, :jsonb, null: false, default: []
    add_index :businesses, :categories, using: :gin
  end
end
