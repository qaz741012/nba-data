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
    # rails data:daily_record[20190225]
    date = args[:date]
    DailyRecordJob.perform_later(date)
  end

end