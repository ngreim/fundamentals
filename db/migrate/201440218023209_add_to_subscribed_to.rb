class AddToSubscribedTo < ActiveRecord::Migration
  def change
    add_column :subscribed_tos, :end_date_time, :time
  end
end