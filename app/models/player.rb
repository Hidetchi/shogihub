require 'open-uri'

class Player < ActiveRecord::Base

belongs_to :teacher, class_name: 'Player', foreign_key: 'teacher_id'
has_many :pupils, class_name: 'Player', foreign_key: 'teacher_id'

def self.find_or_create(name_ja)
  name_ja = name_ja.gsub(/眞/,"真").gsub(/髙/,"高").gsub(/﨑/,"崎")
  name_ja = '真田彩子' if name_ja == '古河彩子'
  name_ja = '上川香織' if name_ja == '松尾香織'
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
  response += open("http://www.shogi.or.jp/player/joryu.html", "r:CP932").read
  response += open("http://www.shogi.or.jp/player/intai.html", "r:CP932").read
  lines = response.split("\n")
  lines.each do |line|
#  f = File.read("/mnt/hgfs/VMWareShare/shogihubtest_players.html", encoding:'cp932')
#  f.split("\n").each do |line|
    if line =~ /heightLine\-(joru)?(\d)(kyu)?/
      if ($3 == "kyu")
        @rank = $2.to_i * (-1)
      else
        @rank = $2.to_i
      end
    elsif line =~ /heightLine-kyakuin/
      @rank = 0
    elsif line =~/class\=\"heightLine\"/
      @rank = -5 
    end
    next if @rank == 0
    if line =~ /\<span\sclass\=\"playerno\"\>(女流)?棋士番号(\d+)/
      @kishi_id = $2.to_i
    elsif line =~ /\<span\sclass\=\"playername_edit\".*kishi\/(.+)\.html\"\>(.+)\<\/a\>/
      url = $1
      name = $2.gsub(/[一二三四五六七八九十]+世名人/,"").gsub(/(名誉|永世).+$/,"").gsub(/[四五六七八九]段/,"").gsub(/[\s　]/,"")
      Player.update_player(1, name, @kishi_id, @rank, url)
      @rank = 0
    elsif line =~ /href\=\"joryu\/(.+)\.html\"\>(.+?)\<\/a\>/
      url = $1
      name = $2.gsub(/女流.+$/,"").gsub(/[\s　]/,"")
      Player.update_player(2, name, @kishi_id, @rank, url) if @rank >= -2
      @rank = 0
    end
  end

  Rails.logger.level = 0
  ""
end

def self.update_player(category, name_ja, kishi_id, rank, url)
  player = Player.find_or_create(name_ja)
  player.update_attributes(category: category, kishi_id: kishi_id, rank: rank, url: url) if (player.category != category || player.rank == nil || player.rank < rank)
end

def load_JSA_detail
  Rails.logger.level = 3
  puts sprintf("Loading %s ...", self.search_key)
  response = open(to_jsa_url, "r:CP932").read
  lines = response.encode('utf-8').split("\n")
  mode = 0
  lines.each do |line|
    next if line == ""
    if mode == 0
      if line =~ /生年月日/
        mode = 1
      elsif line =~ /\>師匠\</
        mode = 2
      elsif line =~/\>棋士番号\</
        mode = 3
      end
    else
      if mode == 1
        if line =~ /(\d+)年(\d+)月(\d+)日/
          self.birthday = Date.new($1.to_i, $2.to_i, $3.to_i)
        end
      elsif mode == 2
        if line =~ /\<dd\>(.+)\<\/dd\>/
          teacher_name = $1.gsub(/[（\(].+[）\)]/,"").gsub(/門下/,"").gsub(/[一二三四五六七八九十]+世名人/,"").gsub(/(名誉|永世|実力制).+$/,"").gsub(/[四五六七八九]段/,"").gsub(/[\s　]/,"")
          teacher = Player.find_or_create(teacher_name)
          self.teacher_id = teacher.id
        end
      elsif mode == 3
        if line =~ /\<dd\>(\d+)\<\/dd\>/
          self.kishi_id = $1.to_i
        end
      end
      mode = 0
    end
    if line =~ /ph_(kishi|joryu)\/(.+)\.jpg/
      self.image_url = $2
    end
  end
  self.save
  Rails.logger.level = 0
  ""
end

def to_s
  self.name ? self.name : self.search_key
end

def to_rank
  return "" unless self.rank
  self.rank.abs.to_s + (self.rank > 0 ? "-Dan" : "-kyu")
end

def to_jsa_url
  if self.category == 1
    "http://www.shogi.or.jp/player/kishi/" + self.url + ".html"
  elsif self.category == 2
    "http://www.shogi.or.jp/player/joryu/" + self.url + ".html"
  else
    ""
  end
end

def to_image_url
  if self.image_url == nil
    ""
  elsif self.category == 1
    "http://www.shogi.or.jp/player/ph_kishi/" + self.image_url + ".jpg"
  elsif self.category == 2
    "http://www.shogi.or.jp/player/ph_joryu/" + self.image_url + ".jpg"
  else
    ""
  end
end

def self.seeds(array)
  array.each do |hash|
    if (hash[:teacher_name])
      teacher_name = hash[:teacher_name].gsub(/[（\(].+[）\)]/,"").gsub(/門下/,"").gsub(/[一二三四五六七八九十]+世名人/,"").gsub(/(実力制|名誉|永世).+$/,"").gsub(/[四五六七八九]段/,"").gsub(/[\s　]/,"")
      teacher = Player.find_or_create(teacher_name)
      hash.delete(:teacher_name)
      hash[:teacher_id] = teacher.id
    end

    if (player = Player.find_by(search_key: hash[:search_key]))
      player.update_attributes(hash)
    else
      Player.create(hash)
    end
  end
end

end
