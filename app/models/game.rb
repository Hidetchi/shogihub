require 'open-uri'
require "nkf"
class Game < ActiveRecord::Base

belongs_to :sente, class_name: 'Player', foreign_key: 'sente_id'
belongs_to :gote, class_name: 'Player', foreign_key: 'gote_id'
belongs_to :tournament

def self.load_JSA_month(year,month)
  #self.load_JSA_list(sprintf('http://www.shogi.or.jp/kisen/month/%d/%02dall.html', year, month), year)
end

def self.load_JSA_latest
  self.load_JSA_list("https://www.shogi.or.jp/game")
end

def self.load_JSA_list(url, year = nil)
  Rails.logger.level = 3

  active = false
  mode = 0 # 0:Results(6 columns), 1:Schedule(5 columns)
  column = 0
  max_column = 100
  response = open(url).read
  lines = response.force_encoding("utf-8").split("\n")
  lines.each do |line|
    active = false if line.include?('</table>')
    active = true if line.include?('<table class="tableElements')
    mode = 0 if line.include?('<div id="jsTabE01_01"')
    mode = 1 if line.include?('<div id="jsTabE01_02"')
    next unless active
    next if line =~ /(奨励|育成)会/
    if line =~ /colspan\=\"(\d+)\".+?(\d*)月(\d*)[日・]/i
      max_column = $1.to_i 
      if max_column == 6
        mode = 0
      elsif max_column == 5
        mode = 1
      end
      if year
        @date = Date.new(year, $2.to_i, $3.to_i)
      else
        today = Date.today
        @date = Date.new(today.year, $2.to_i, $3.to_i)
        if (@date - today > 180)
          @date = Date.new(today.year - 1, $2.to_i, $3.to_i)
        elsif (today - @date > 180)
          @date = Date.new(today.year + 1, $2.to_i, $3.to_i)
        end
      end
    else
      if line =~ /^\<tr\>\<td[\s\>]/i
        if line =~ /^\<tr\>\<td\srowspan=\"(\d+)\"/i
          @elements = Array.new(7)
          column = 0
        else
          prev_tournament = @elements[0]
          @elements = Array.new(7)
          @elements[0] = prev_tournament
          column = 1
        end
      end
			line = line.gsub(/\<td.*?\>\s*(.*?)\s*\<\/td\>/i) {
        str = $1
#        if str =~ /^\<a.*?\>(.+?)\<\/a\>/
#          str = $1
#        end
        @elements[column] = str.gsub(/\<.+?\>/i, "")
        column += 1
			  ""
			}
      if column == max_column
        result = mode == 0 ? ["○", "●", "引", "□", "■"].index(@elements[1]) : nil
        sente = @elements[mode == 0 ? 2 : 1].gsub(/\s+/,"").gsub(/[※\*＊　]/,"").gsub(/アマ/,"").gsub(/(奨励会)?[1234567１２３４５６７初二三][級段]$/,"")
        gote = @elements[mode == 0 ? 3 : 2].gsub(/\s+/,"").gsub(/[※\*＊　]/,"").gsub(/アマ/,"").gsub(/(奨励会)?[1234567１２３４５６７初二三][級段]$/,"")
        event = @elements[0]
        description = @elements[mode == 0 ? 5 : 4]
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
  description = ""
  if event =~ /^(.+?)\s(.+)$/
    event = $1
    description = $2
  end
  if description =~ /^第([123456789１２３４５６７８９])局/
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
  elsif event =~/棋聖/
    tournament_name = '棋聖'
  elsif event =~/清麗/
    tournament_name = '清麗'
  elsif event =~/王将/ && event !~/女流/
    tournament_name = '王将'
  elsif event =~ /女流名人/
    tournament_name = '女流名人' 
  elsif event =~ /倉敷藤花/
    tournament_name = '倉敷藤花' 
  elsif event =~ /女流王座/
    tournament_name = '女流王座' 
  elsif event =~ /(レディース|マイナビ)/
    tournament_name = 'マイナビ' 
  elsif event =~ /^朝日/
    tournament_name = '朝日杯'
  elsif event =~ /(NHK|ＮＨＫ|銀河|最強|新人王|加古川|女流王将|YAMADA)/
    #puts sprintf("TV/Online/Rookie Tournament %s is ignored.", event)
    return
  else
    tournament_name = event
  end
  tournament_name = tournament_name.gsub(/戦$/,"")
  unless (tournament = Tournament.find_by(search_key: tournament_name))
    puts sprintf("Tournament with search key %s not found.", tournament_name)
    return
  end
  if sente =~ /^.+か[^おほり]+$/ || gote =~ /^.+か[^おほり]+$/
    puts sprintf("Ignored %s vs %s", sente, gote)
    return
  end
  player1 = Player.find_or_create(sente)
  player2 = Player.find_or_create(gote)
  unless (game = Game.find_by(sente_id: player1.id, gote_id: player2.id, tournament_id: tournament.id, game_date: date))
    if (game = Game.find_by(sente_id: player2.id, gote_id: player1.id, tournament_id: tournament.id, game_date: date, result: nil))
      game.sente_id = player1.id
      game.gote_id = player2.id
    else
      game = Game.create(sente_id: player1.id, gote_id: player2.id, tournament_id: tournament.id, game_date: date)
    end
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
