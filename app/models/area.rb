class Area < ApplicationRecord
  has_many :subareas, dependent: :restrict_with_exception
  has_many :teams, through: :subareas
  
  validates :name, presence: true
end
