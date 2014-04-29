class CreateEndedSubscription < ActiveRecord::Migration
  def change
    create_table :ended_subscriptions do |t|
      t.integer :user_id
      t.integer :provider_id
      t.integer :subscription_id
      t.integer :end_date
      t.string :subscription_type
      t.time :end_date_time
    end
  end
end