class ChangeBirthdateDatatypeInPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :birthdate
    add_column :players, :birthdate, :date
  end
end
