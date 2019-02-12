class RenameAbbrevNameToAbbrNameInTeams < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :abbrev_name, :abbr_name
  end
end
