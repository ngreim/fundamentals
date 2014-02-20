class CreateAwayTeams < ActiveRecord::Migration
  def change
    create_table :away_teams do |t|
      t.references :game
      t.references :team
    end
  end
end
