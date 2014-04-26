class RemoveAddUserType < ActiveRecord::Migration
  def change
    remove_column :users, :type, :string
    add_column :users, :user_type, :integer
  end
end