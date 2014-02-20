class CreateOrganizationAdmins < ActiveRecord::Migration
  def change
    create_table :organization_admins do |t|
      t.references :organization
      t.references :user
    end
  end
end
