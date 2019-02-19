class AddStatIdToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :stat_id, :string
  end
end
