class AddToEndedSubscription < ActiveRecord::Migration
  def change
    add_column :ended_subscriptions, :old_id, :integer
  end
end