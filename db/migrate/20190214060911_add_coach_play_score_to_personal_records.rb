class AddCoachPlayScoreToPersonalRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :personal_records, :coach_play_score, :integer
  end
end
