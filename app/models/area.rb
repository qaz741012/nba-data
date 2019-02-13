class Area < ApplicationRecord
  has_many :subareas, dependent: :restrict_with_exception
  
  validates :name, presence: true
end
