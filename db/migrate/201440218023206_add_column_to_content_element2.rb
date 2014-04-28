class AddColumnToContentElement2 < ActiveRecord::Migration
  def change
    add_column :content_element, :format, :references
  end
end