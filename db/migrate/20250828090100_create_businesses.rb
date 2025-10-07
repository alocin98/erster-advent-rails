class CreateBusinesses < ActiveRecord::Migration[8.0]
  def change
    create_table :businesses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :business_name, null: false
      t.string :phone, null: false
      t.text :address, null: false
      t.text :billing_address, null: false
      t.string :main_image
      t.string :image_gallery1
      t.string :image_gallery2
      t.string :image_gallery3
      t.text :map_link, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
