class DailyRecordJob < ApplicationJob
  queue_as :data

  def perform(date)
    if Game.find_by_date(date.to_date)
      puts "Data already got."
      return
    end

    uri = URI("http://data.nba.net/data/10s/prod/v1/#{date}/scoreboard.json")
    res = Net::HTTP.get(uri)
    game_data = JSON.parse(res)

    game_data['games'].each do |game|
      current_game = Game.create(
        stat_id: game['gameId'],
        venue: game['arena']['name'],
        home_team_id: Team.find_by_stat_id(game['hTeam']['teamId']).id,
        home_team_score: game['hTeam']['score'].to_i,
        away_team_id: Team.find_by_stat_id(game['vTeam']['teamId']).id,
        away_team_score: game['vTeam']['score'].to_i,
        date: date.to_date
      )

      next if current_game.invalid?

      uri = URI("http://data.nba.net/data/10s/prod/v1/#{date}/#{game['gameId']}_boxscore.json")
      res = Net::HTTP.get(uri)
      boxscore_data = JSON.parse(res)

      players = boxscore_data['stats']['activePlayers']
      players.each do |player|
        current_player = Player.find_by_stat_id(player['personId'])
        PersonalRecord.create(
          player_id: current_player.id,
          game_id: current_game.id,
          min: player['min'],
          fgm: player['fgm'].to_i,
          fga: player['fga'].to_i,
          tpm: player['tpm'].to_i,
          tpa: player['tpa'].to_i,
          ftm: player['ftm'].to_i,
          fta: player['fta'].to_i,
          oreb: player['offReb'].to_i,
          dreb: player['defReb'].to_i,
          ast: player['assists'].to_i,
          tov: player['turnovers'].to_i,
          stl: player['steals'].to_i,
          blk: player['blocks'].to_i,
          pf: player['pFouls'].to_i,
          pts: player['points'].to_i,
          plus_minus: player['plusMinus'].to_i,
          dnp: player['dpn']
        ) if current_player.present?
      end
    end if game_data['games'].present?
  end

end
