class CreateFollowTeams < ActiveRecord::Migration
  def change
    create_table :follow_teams do |t|
      t.references :user
      t.references :team
    end
  end
end
