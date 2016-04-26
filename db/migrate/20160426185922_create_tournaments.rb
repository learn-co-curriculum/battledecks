class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :commissioner_id

      t.timestamps null: false
    end

    add_index :tournaments, :commissioner_id
  end
end
