class PersonalRecord < ApplicationRecord
  before_create :count_coach_play_score

  belongs_to :player
  belongs_to :game

  validates :game_id, uniqueness: { scope: :player_id }

  private

  def count_coach_play_score
    self.coach_play_score = self.pts * 2 +
                            self.oreb * 4 +
                            self.dreb * 3 +
                            self.ast * 4 +
                            self.blk * 6 +
                            self.stl * 6 +
                            self.tpm * 2 +
                            (self.fga - self.fgm) * -1 +
                            (self.fta - self.ftm) * -2 +
                            self.tov * -4 +
                            self.pf * -2
  end
end
