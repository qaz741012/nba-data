class AddBackNumberAndPositionToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :back_number, :integer
    add_column :players, :position, :string
  end
end
