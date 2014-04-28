class AddColumnToContentElement2 < ActiveRecord::Migration
  def change
    add_column :subscribe_tos, :subscription_length, :integer
  end
end