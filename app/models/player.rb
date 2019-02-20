class Player < ApplicationRecord
  belongs_to :team

  has_many :personal_records, dependent: :restrict_with_exception
  has_many :games, through: :personal_records

  validates :stat_id, uniqueness: true
end
