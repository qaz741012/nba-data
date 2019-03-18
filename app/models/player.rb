class Player < ApplicationRecord
  belongs_to :team

  has_many :personal_records, dependent: :restrict_with_exception
  has_many :games, through: :personal_records

  validates :stat_id, uniqueness: true

  def to_csv(opt={})
    limit = opt[:limit].present? ? opt[:limit] : nil
    if opt[:selected_opponents_id].present?
      selected_opponents_id = opt[:selected_opponents_id]
    else
      selected_opponents_id = Team.where.not(id: self.team).pluck(:id)
    end

    attributes = %w[coach_play_score min fgm fga tpm tpa ftm fta oreb dreb ast tov stl blk pf pts plus_minus dnp]
    header = %w[date opponent].concat attributes

    CSV.generate(headers: true) do |csv|
      csv << header

      records = PersonalRecord.joins(:player, :game)
                              .where(player_id: self.id)
                              .merge(Game.where(home_team_id: selected_opponents_id).or(Game.where(away_team_id: selected_opponents_id)))
                              .order("games.date desc")
                              .limit(limit)

      records.each do |record|
        row = []
        row << record.game.date.strftime("%Y-%m-%d")
        row << self.team.opponent(record.game).abbr_name
        row.concat attributes.map { |attr| record.send(attr) }
        csv << row
      end
    end
  end

end
