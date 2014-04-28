class AddColumnToContentElement2 < ActiveRecord::Migration
  def change
    add_column :subscribe_tos, :subscription_length, :integer
    add_column :subscribe_tos, :end_date, :integer
  end
end