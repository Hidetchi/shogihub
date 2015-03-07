class Player < ActiveRecord::Base

def self.find_or_create(name_ja)
  name_ja = name_ja.gsub(/眞/,"真").gsub(/髙/,"高").gsub(/﨑/,"崎")
  unless (player = Player.find_by(search_key: name_ja))
    player = Player.create(search_key: name_ja)
    puts sprintf("New player %s created!", name_ja)
  end
  player
end

def self.load_JSA_all
  Rails.logger.level = 3

  @rank = 0
  @kishi_id = 0
  response = open("http://www.shogi.or.jp/player/index.html", "r:CP932").read
  lines = response.split("\n")
  lines.each do |line|
#  f = File.read("/mnt/hgfs/VMWareShare/shogihubtest_players.html", encoding:'cp932')
#  f.split("\n").each do |line|
    if line =~ /heightLine\-(\d)/
      @rank = $1.to_i
    end
    next if @rank == 0
    if line =~ /\<span\sclass\=\"playerno\"\>棋士番号(\d+)/
      @kishi_id = $1.to_i
    elsif line =~ /\<span\sclass\=\"playername_edit\".*kishi\/(.+)\.html\"\>(.+)\<\/a\>/
      url = $1
      name = $2.gsub(/[\s　]/,"")
      Player.update_player(1, name, @kishi_id, @rank, url)
    end
  end

  Rails.logger.level = 0
  ""
end

def self.update_player(category, name_ja, kishi_id, rank, url)
  player = Player.find_or_create(name_ja)
  player.update_attributes(category: category, kishi_id: kishi_id, rank: rank, url: url) if player.rank != rank
end

def to_s
  self.name ? self.name : self.search_key
end

def to_rank
  return "" unless self.rank
  ["", "", "", "", "4-Dan", "5-Dan", "6-Dan", "7-Dan", "8-Dan", "9-Dan"][self.rank]
end

def to_jsa_url
  "http://www.shogi.or.jp/player/kishi/" + self.url + ".html"
end

end
