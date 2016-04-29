class AddTypeToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_type, :string, default: "regular"
  end
end
