class AddAverageCoachPlayScoreToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :average_coach_play_score, :float
  end
end
