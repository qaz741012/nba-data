namespace :crawl do

  task daily: :environment do
    exec "python3 #{Rails.root.join('lib', 'tasks', 'daily.py')}"
  end

  task players: :environment do
    exec "python3 #{Rails.root.join('lib', 'tasks', 'players.py')}"
  end

end