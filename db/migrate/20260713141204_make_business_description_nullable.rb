class MakeBusinessDescriptionNullable < ActiveRecord::Migration[8.0]
  def change
    change_column_null :businesses, :description, true
  end
end
