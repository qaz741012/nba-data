class AddFullNameAndAbbrevNameToTeams < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :name, :full_name
    add_column :teams, :abbrev_name, :string
  end
end
