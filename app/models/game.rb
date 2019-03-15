class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  validates :stat_id, uniqueness: true

  def racing_teams
    [self.home_team, self.away_team]
  end
end
