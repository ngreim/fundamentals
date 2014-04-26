class CreateDeliveryMode < ActiveRecord::Migration
  def change
    create_table :delivery_mode do |t|
	    t.string :name
    end
  end
end