class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime :date
      t.integer :home_team_id
      t.integer :away_team_id
      t.string :venue

      t.timestamps
    end
  end
end
