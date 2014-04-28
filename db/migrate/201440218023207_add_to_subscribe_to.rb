class AddToSubscribeTo < ActiveRecord::Migration
  def change
    add_column :subscribed_tos, :end_date, :integer
  end
end