# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, "log/cron_log.log"
set :environment, :production

every 1.day, :at => '11pm' do
  runner "Game.load_JSA_latest"
end

# Learn more: http://github.com/javan/whenever
