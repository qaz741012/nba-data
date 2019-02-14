class ChangeDateDatatypeInGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :date
    add_column :games, :date, :date
  end
end
