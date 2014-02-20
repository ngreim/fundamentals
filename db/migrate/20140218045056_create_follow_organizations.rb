class CreateFollowOrganizations < ActiveRecord::Migration
  def change
    create_table :follow_organizations do |t|
      t.references :user
      t.references :organization
    end
  end
end
