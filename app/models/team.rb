class Team < ApplicationRecord
  mount_uploader :logo, LogoUploader

  belongs_to :subarea
  has_many :players, dependent: :restrict_with_exception
end
