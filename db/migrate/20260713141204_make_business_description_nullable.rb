class MakeBusinessDescriptionNullable < ActiveRecord::Migration[8.0]
  def change
    return unless column_exists?(:businesses, :description)

    change_column_null :businesses, :description, true
  end
end
