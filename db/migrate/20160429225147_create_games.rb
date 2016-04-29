class CreateGames < ActiveRecord::Migration
  def change
    create_table :games, id: false do |t|
      t.primary_key :game_id
      t.integer :home_id
      t.integer :away_id
      t.string :season
      t.datetime :date
      t.timestamps null: false
    end
  end
end
