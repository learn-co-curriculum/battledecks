class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :match_id
      t.integer :voter_id
      t.integer :player_id

      t.timestamps null: false
    end

    add_index :votes, :match_id
    add_index :votes, :voter_id
    add_index :votes, [:match_id, :voter_id], :unique => true
  end
end
