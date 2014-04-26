class AddColumnToContentElement < ActiveRecord::Migration
  def change
    add_column :content_elements, :format, :string
  end
end