class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, id: false do |t|
      t.primary_key :team_id
      t.string :city
      t.string :name
      t.string :abbreviation

      t.timestamps null: false
    end
    add_index :teams, :team_id, unique: true
  end
end
