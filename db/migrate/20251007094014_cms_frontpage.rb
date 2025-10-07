class CmsFrontpage < ActiveRecord::Migration[8.0]
   def change
     create_table :cms_blocks do |t|
       t.string :page, null: false
       t.integer :position, null: false
       t.integer :block_type, null: false
       t.boolean :is_active, null: false, default: true

       t.string :button_url
       t.string :button_text

       t.text :question
       t.text :answer

        t.timestamps
     end
  end
end
