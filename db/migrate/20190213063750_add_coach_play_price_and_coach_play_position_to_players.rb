class AddCoachPlayPriceAndCoachPlayPositionToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :coach_play_price, :integer
    add_column :players, :coach_play_position, :string
  end
end
