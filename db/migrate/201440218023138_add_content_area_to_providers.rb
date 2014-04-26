class AddContentAreaToProviders < ActiveRecord::Migration
  def change
    add_column :provider, :content_area_id, :integer
    add_column :provider, :delivery_mode_id, :integer
  end
end