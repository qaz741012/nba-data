class AddStatIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :stat_id, :string
  end
end
