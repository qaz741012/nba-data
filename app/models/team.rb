class Team < ApplicationRecord
  mount_uploader :logo, LogoUploader

  belongs_to :subarea
  has_many :players, dependent: :restrict_with_exception

  has_many :home_games, class_name: 'Game', foreign_key: :home_team_id, inverse_of: :home_team
  has_many :away_games, class_name: 'Game', foreign_key: :away_team_id, inverse_of: :away_team

  validates :stat_id, uniqueness: true

  def opponent(game)
    game.racing_teams.each do |racing_team|
      return racing_team if self != racing_team
    end
  end
end
