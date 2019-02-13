class Subarea < ApplicationRecord
  belongs_to :area
  has_many :teams, dependent: :restrict_with_exception

  validates :name, presence: true
end
