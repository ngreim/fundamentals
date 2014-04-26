class AddColumnToContentElement < ActiveRecord::Migration
  def change
    add_column :content_elements, :provider_id, :integer
  end
end