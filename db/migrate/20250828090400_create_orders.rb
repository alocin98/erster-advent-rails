class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :product, null: false, foreign_key: true
      t.bigint :id_of_user, null: false
      t.integer :quantity, null: false
      t.string :size, null: false
      t.string :order_no, null: false
      t.string :accept_order, null: false

      t.timestamps
    end

    add_index :orders, :id_of_user
    add_foreign_key :orders, :users, column: :id_of_user
  end
end
