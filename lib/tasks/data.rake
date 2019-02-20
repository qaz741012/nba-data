namespace :data do

  task connect_team: :environment do
    year = 2018
    uri = URI("http://data.nba.net/data/10s/prod/v1/#{year}/teams.json")
    res = Net::HTTP.get(uri)
    data = JSON.parse(res)

    data['league']['standard'].each do |team|
      if team['isNBAFranchise']
        Team.find_by_abbr_name(team['tricode']).update(stat_id: team['teamId'])
      end
    end
  end

  task connect_player: :environment do
    year = 2018
    uri = URI("http://data.nba.net/data/10s/prod/v1/2018/players.json")
    res = Net::HTTP.get(uri)
    data = JSON.parse(res)

    data['league']['standard'].each do |player|
      team = Team.find_by_stat_id(player['teamId'])
      if team
        Player.create(
          full_name: "#{player['firstName']} #{player['lastName']}",
          stat_id: player['personId'],
          team_id: team.id,
          back_number: player['jersey'].to_i,
          position: player['pos'],
          birthdate: player['dateOfBirthUTC'].to_date
        )
      end
    end
  end

  task :daily_record, [:date] => :environment do |task, args|
    date = args[:date]
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