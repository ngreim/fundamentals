class CreateGameAdmins < ActiveRecord::Migration
  def change
    create_table :game_admins do |t|
      t.references :game
      t.references :user
    end
  end
end
