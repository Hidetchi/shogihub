# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, "log/cron_log.log"
set :environment, :production

every 1.day, :at => '3am' do
  runner "Game.load_JSA_latest"
  runner "News.fetch_from_JSA"
end

every :monday, at: '3am' do
  runner "Player.load_JSA_all"
end

every 1.hour do
  runner "News.check_auto_publishing"
end

# Learn more: http://github.com/javan/whenever
