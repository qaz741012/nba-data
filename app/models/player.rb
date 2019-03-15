class Player < ApplicationRecord
  belongs_to :team

  has_many :personal_records, dependent: :restrict_with_exception
  has_many :games, through: :personal_records

  validates :stat_id, uniqueness: true

  def to_csv
    attributes = %w{min fgm fga}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      self.personal_records.each do |record|
        csv << attributes.map{ |attr| record.send(attr) }
      end
    end
  end
end
