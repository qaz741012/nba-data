class CreatePersonalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_records do |t|
      t.integer :player_id
      t.integer :game_id
      t.string :min
      t.integer :fgm
      t.integer :fga
      t.integer '3pm'
      t.integer '3pa'
      t.integer :ftm
      t.integer :fta
      t.integer :oreb
      t.integer :dreb
      t.integer :ast
      t.integer :tov
      t.integer :stl
      t.integer :blk
      t.integer :pf
      t.integer :pts
      t.integer :plus_minus

      t.timestamps
    end
  end
end
