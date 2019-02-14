class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :full_name
      t.integer :price
      t.string :position
      t.integer :team_id
      t.datetime :birthdate
      t.integer :coach_play_price
      t.string :coach_play_position
      t.integer :back_number

      t.timestamps
    end
  end
end
