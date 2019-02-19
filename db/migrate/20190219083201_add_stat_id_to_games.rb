class AddStatIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :stat_id, :string
  end
end
