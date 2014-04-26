class ContentElement < ActiveRecord::Migration
  def change
    create_table :content_elements do |t|
	    t.string :name
      t.string :url_link
      t.references :provider
    end
  end
end