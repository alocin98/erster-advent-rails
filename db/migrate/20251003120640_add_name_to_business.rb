class AddNameToBusiness < ActiveRecord::Migration[8.0]
  def change
    add_column :businesses, :name, :string, null: false, default: ""
    add_column :businesses, :email, :string, null: false, default: ""
    add_column :businesses, :website, :string, null: false, default: ""
    add_column :businesses, :first_advent_specialities, :string, array: true, default: []
  end
end
