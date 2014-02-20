class CreateHomeTeams < ActiveRecord::Migration
  def change
    create_table :home_teams do |t|
      t.references :game
      t.references :team
    end
  end
end
