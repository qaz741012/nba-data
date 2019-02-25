class DatasController < ApplicationController

  def daily
    @date = DateTime.now.utc - 7.hours
    date_format = @date.strftime("%Y%m%d")

    # 已經抓過資料
    @games = Game.where(date: @date)
    if @games.present?
      @games = @games.map do |game|
        [
          game.away_team,
          game.home_team,
          "#{game.away_team_score}-#{game.home_team_score}"
        ]
      end
    end and return
    
    uri = URI("http://data.nba.net/data/10s/prod/v1/#{date_format}/scoreboard.json")
    data = JSON.parse(Net::HTTP.get(uri))

    # 本日無比賽
    if data['games'].blank?
      @st = "There is no game today."
    end and return

    # 確認是否有比賽沒比完
    finish = true
    data['games'].each do |game|
      if !game['endTimeUTC'].present?
        finish = false
        break
      end
    end

    @games = data["games"].map do |game|
      [
        Team.find_by_stat_id(game['vTeam']['teamId']),
        Team.find_by_stat_id(game['hTeam']['teamId']),
        game['endTimeUTC'].present? ? "#{game['vTeam']['score']}-#{game['hTeam']['score']}" : "Havent finished"
      ]
    end

    # 比賽全部結束 => 存資料
    DailyRecordJob.perform_later(date_format) if finish
  end

end
