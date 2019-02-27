class DatasController < ApplicationController
  respond_to :html, :json, only: :daily

  def daily
    @finish = true
    @date = params[:date].present? ? params[:date].to_date : DateTime.now.utc - 7.hours
    date_format = @date.strftime("%Y%m%d")
    gon.date = date_format

    # 已經抓過資料
    @games = Game.where(date: @date)
    if @games.present?
      @games = @games.map do |game|
        {
          :away => game.away_team,
          :home => game.home_team,
          :status => "#{game.away_team_score}-#{game.home_team_score}",
          :stat_id => game.stat_id
        }
      end
    end and return
    
    uri = URI("http://data.nba.net/data/10s/prod/v1/#{date_format}/scoreboard.json")
    data = JSON.parse(Net::HTTP.get(uri))

    # 本日無比賽
    if data['games'].blank?
      @st = "There is no game today."
    end and return

    # 確認是否有比賽沒比完
    data['games'].each do |game|
      if !game['endTimeUTC'].present?
        @finish = false
        break
      end
    end

    @games = data["games"].map do |game|
      {
        :away => Team.find_by_stat_id(game['vTeam']['teamId']),
        :home => Team.find_by_stat_id(game['hTeam']['teamId']),
        :status => game['endTimeUTC'].present? ? "#{game['vTeam']['score']}-#{game['hTeam']['score']}" : game['startTimeEastern'],
        :stat_id => game['gameId']
      }
    end

    # 比賽全部結束 => 存資料
    DailyRecordJob.perform_later(date_format) if @finish
  end

end
