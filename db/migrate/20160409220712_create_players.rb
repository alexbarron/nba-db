class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, id: false do |t|
      t.primary_key :player_id
      t.integer :team_id
      t.string :name

      t.timestamps null: false
    end

    add_index :players, :player_id, unique: true
  end
end
