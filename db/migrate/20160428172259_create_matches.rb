class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :player_1_id
      t.integer :player_1_deck_id
      t.integer :player_2_id
      t.integer :player_2_deck_id
      t.integer :winner_id 
      t.integer :round 
      t.integer :tournament_id  

      t.timestamps null: false
    end
    
    add_index :matches, :winner_id
    add_index :matches, :round
    add_index :matches, :tournament_id
  end
end
