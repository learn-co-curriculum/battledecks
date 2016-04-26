class CreateTournamentPlayers < ActiveRecord::Migration
  def change
    create_table :tournament_players do |t|
      t.integer :tournament_id
      t.integer :player_id

      t.timestamps null: false
    end

    add_index :tournament_players, :tournament_id
    add_index :tournament_players, :player_id
    add_index :tournament_players, [:tournament_id, :player_id], :unique => true
  end
end
