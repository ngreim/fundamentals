class AddToSubscribedTo < ActiveRecord::Migration
  def change
    add_column :subscribed_tos, :subscription_type, :string
  end
end