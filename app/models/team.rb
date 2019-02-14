class Team < ApplicationRecord
  mount_uploader :logo, LogoUploader

  belongs_to :subarea
  has_many :players, dependent: :restrict_with_exception

  has_many :home_games, foreign_key: :home_team_id, class_name: 'Game'
  has_many :away_games, foreign_key: :away_team_id, class_name: 'Game'
end
