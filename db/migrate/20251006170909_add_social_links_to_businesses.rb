class AddSocialLinksToBusinesses < ActiveRecord::Migration[8.0]
  def change
    add_column :businesses, :instagram, :string, null: false, default: ""
    add_column :businesses, :tiktok, :string, null: false, default: ""
    add_column :businesses, :linkedin, :string, null: false, default: ""
    add_column :businesses, :facebook, :string, null: false, default: ""
  end
end
