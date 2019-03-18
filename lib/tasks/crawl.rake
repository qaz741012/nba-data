namespace :crawl do

  task players: :environment do
    exec "python3 #{Rails.root.join('lib', 'tasks', 'players.py')}"
  end

  task coach_play_price: :environment do
    exec "python3 #{Rails.root.join('lib', 'tasks', 'coach_play_price.py')}"
    puts "Finish 'crawl:coach_play_price' @ #{DateTime.now.utc.strftime('%Y-%m-%d-T%H:%M:%S')}"
  end

  task get_daily_record: :environment do
    date_format = (Date.today - 1.day).strftime("%Y%m%d")
    DailyRecordJob.perform_later(date_format)
  end

end