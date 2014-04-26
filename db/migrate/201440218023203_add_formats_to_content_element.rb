class AddFormatsToContentElement < ActiveRecord::Migration
  def change
    remove_column :content_elements, :format, :string
    add_column :content_elements, :format_type, :string
  end
end