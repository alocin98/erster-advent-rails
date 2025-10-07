class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.string :main_product_image, null: false
      t.jsonb :images_of_product, null: false
      t.jsonb :sizes, null: false
      t.string :delievry_time, null: false
      t.integer :total_orders, null: false, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
