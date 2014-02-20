class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
	t.references :organization
	t.string     :sport
    end
  end
end
