require 'open-uri'
require "nkf"
class Game < ActiveRecord::Base

belongs_to :sente, class_name: 'Player', foreign_key: 'sente_id'
belongs_to :gote, class_name: 'Player', foreign_key: 'gote_id'
belongs_to :tournament

def self.load_JSA_month(year,month)
  self.load_JSA_list(sprintf('http://www.shogi.or.jp/kisen/month/%d/%02dall.html', year, month), year)
end

def self.load_JSA_latest
  self.load_JSA_list("http://www.shogi.or.jp/kisen/week/kekka.html")
  self.load_JSA_list("http://www.shogi.or.jp/kisen/week/yotei.html")
end

def self.load_JSA_list(url, year = nil)
  Rails.logger.level = 3

  active = false
  column = 0
  response = open(url, "r:CP932").read
  lines = response.split("\n")
  lines.each do |line|
#  f = File.read("/mnt/hgfs/VMWareShare/shogihubtest_monthly.html", encoding:'cp932')
#  f.split("\n").each do |line|
    active = true if line =~ /\<table\>/i
    active = false if line =~ /\<\/table\>/i
    next unless active
    next if line =~ /(奨励|育成)会/
    if line =~ /\<strong\>\s*(\d*)月(\d*)[日・]/i
      if year
        @date = Date.new(year, $1.to_i, $2.to_i)
      else
        today = Date.today
        @date = Date.new(today.year, $1.to_i, $2.to_i)
        if (@date - today > 180)
          @date = Date.new(today.year - 1, $1.to_i, $2.to_i)
        elsif (today - @date > 180)
          @date = Date.new(today.year + 1, $1.to_i, $2.to_i)
        end
      end
    else
      if line =~ /\<tr/i
        column = 0
        @elements = Array.new(7)
      end
			line = line.gsub(/\<td\>\s*(.*?)\s*\<\/td\>/i) {
        @elements[column] = $1
        column += 1
			  ""
			}
      if column == 7
        result = ["○", "●", "引", "□", "■"].index(@elements[0])
        sente = @elements[1].gsub(/\s+/,"").gsub(/[※\*＊　]/,"").gsub(/アマ/,"").gsub(/(奨励会)?[12345１２３４５初二三][級段]$/,"")
        gote = @elements[2].gsub(/\s+/,"").gsub(/[※\*＊　]/,"").gsub(/アマ/,"").gsub(/(奨励会)?[12345１２３４５初二三][級段]$/,"")
        event = @elements[4].gsub(/\s+/,"")
        description = @elements[5]
        Game.update_game(@date, sente, gote, result, event, description)
        column = 0
      end
    end
  end
  
  Rails.logger.level = 0
  ""
end

def self.update_game(date, sente, gote, result, event, description)
  return if event == ""
  if description =~ /第([123456789１２３４５６７８９])局/
    description = "Title match, Game " + NKF.nkf('-m0Z1 -w', $1)
  else
    description = ""
  end
  event = event.gsub(/[\s　]/,"")
  event = event.gsub(/[紅白]組$/,"")
  event = ('順位戦' + event) if event =~ /^[ABCＡＢＣ]級/
  if event =~ /順位戦/
    tournament_name = '順位戦'
    if event =~ /([ABCＡＢＣ])級([123１２３]?)組?/
      description = NKF.nkf('-m0Z1 -w', $1) + NKF.nkf('-m0Z1 -w', $2) + "-class"
    end
  elsif event =~ /竜王戦/
    tournament_name = '竜王戦'
    if event =~ /([123456１２３４５６])組/
      description = "Class " + NKF.nkf('-m0Z1 -w', $1)
    end
  elsif event =~ /女流名人/
    tournament_name = '女流名人' 
  elsif event =~ /倉敷藤花/
    tournament_name = '倉敷藤花' 
  elsif event =~ /(レディース|マイナビ)/
    tournament_name = 'マイナビ' 
  elsif event =~ /^朝日/
    tournament_name = '朝日杯'
  elsif event =~ /(NHK|ＮＨＫ|銀河|最強|新人王|加古川)/
#    puts sprintf("TV/Online/Rookie Tournament %s is ignored.", event)
    return
  else
    tournament_name = event
  end
  tournament_name = tournament_name.gsub(/戦$/,"")
  unless (tournament = Tournament.find_by(search_key: tournament_name))
    puts sprintf("Tournament with search key %s not found.", tournament_name)
    return
  end
  if sente =~ /^.+か[^り]+$/ || gote =~ /^.+か[^り]+$/
    puts sprintf("Ignored %s vs %s", sente, gote)
    return
  end
  player1 = Player.find_or_create(sente)
  player2 = Player.find_or_create(gote)
  unless (game = Game.find_by(sente_id: player1.id, gote_id: player2.id, tournament_id: tournament.id, game_date: date))
    game = Game.create(sente_id: player1.id, gote_id: player2.id, tournament_id: tournament.id, game_date: date)
  end
  game.update_attributes(result: result, description: description)
end

def to_result_mark(sente)
  if result == 0
    return sente ? "○" : "●"
  elsif result == 1
    return sente ? "●" : "○"
  elsif result == 3
    return sente ? "□" : "■"
  elsif result == 4
    return sente ? "■" : "□"
  else
    return ""
  end
end

end
