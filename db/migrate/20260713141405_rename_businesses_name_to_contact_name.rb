class RenameBusinessesNameToContactName < ActiveRecord::Migration[8.0]
  def change
    return unless column_exists?(:businesses, :name)
    return if column_exists?(:businesses, :contact_name)

    rename_column :businesses, :name, :contact_name
  end
end
