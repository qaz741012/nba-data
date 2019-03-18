# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# ENV['RAILS_ENV'] = "#{@pre_set_variables[:environment]}"

set :output, "log/cron.log"
env :PATH, ENV['PATH']
set :environment, :production
set :chronic_options, hours24: true
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every :day, at: '20:00' do
  rake "crawl:coach_play_price"
end

every :day, at: ['15:00', '18:00'] do
  rake "crawl:get_daily_record"
end

# Learn more: http://github.com/javan/whenever
