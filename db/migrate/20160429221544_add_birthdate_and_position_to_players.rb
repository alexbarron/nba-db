class AddBirthdateAndPositionToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :birthdate, :string
    add_column :players, :position, :string
  end
end
