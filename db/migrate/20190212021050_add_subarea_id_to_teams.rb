class AddSubareaIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :subarea_id, :integer
  end
end
