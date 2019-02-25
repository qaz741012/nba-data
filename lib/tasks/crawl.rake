namespace :crawl do

  task players: :environment do
    exec "python3 #{Rails.root.join('lib', 'tasks', 'players.py')}"
  end

  task coach_play_price: :environment do
    exec "python3 #{Rails.root.join('lib', 'tasks', 'coach_play_price.py')}"
  end

end