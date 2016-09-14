require 'open-uri'

class Player < ActiveRecord::Base

belongs_to :teacher, class_name: 'Player', foreign_key: 'teacher_id'
has_many :pupils, class_name: 'Player', foreign_key: 'teacher_id'
has_many :event_players
has_many :events, through: :event_players

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
  retired = false
  response = ""
#  response += open("http://www.shogi.or.jp/player/pro.html").read
  response += open("http://www.shogi.or.jp/player/lady.html").read
  response += "#INTAI_START\n"
  response += open("http://www.shogi.or.jp/player/retirement.html").read
  lines = response.split("\n")
  lines.each do |line|
    if line == "#INTAI_START"
      retired = true
      @rank = 0
      next
    end
#    if line =~ /heightLine\-(joru)?(\d)(kyu)?/
#      if ($3 == "kyu")
#        @rank = $2.to_i * (-1)
#      else
#        @rank = $2.to_i
#      end
#    elsif line =~ /heightLine-kyakuin/
#      @rank = 0
#    elsif line =~/class\=\"heightLine\"/
#      @rank = -5 
#    end
#    next if @rank == 0
#    if line =~ /\<span\sclass\=\"playerno\"\>(女流)?棋士番号(\d+)/
#      @kishi_id = $2.to_i
#    elsif line =~ /\<span\sclass\=\"playername_edit\".*kishi\/(.+)\.html\"\>(.+)\<\/a\>/
#      url = $1
#      name = $2.gsub(/[一二三四五六七八九十]+世名人/,"").gsub(/(名誉|永世).+$/,"").gsub(/[四五六七八九]段/,"").gsub(/[\s　]/,"")
#      Player.update_player(1, name, @kishi_id, @rank, url, retired)
#      @rank = 0
#    elsif line =~ /href\=\"joryu\/(.+)\.html\"\>(.+?)\<\/a\>/
#      url = $1
#      name = $2.gsub(/女流.+$/,"").gsub(/[\s　]/,"")
#      Player.update_player(2, name, @kishi_id, @rank, url, retired)
#      @rank = 0
#    end
    if line =~ /\<a\shref\=\"\/player\/(pro|lady)\/(\d+)\.html\"\>(.+?)\<\/a\>/
      player_type = $1
      id = $2
      name = $3
      if player_type == "lady"
        p = Player.find_by(search_key: name)
        if p
          p.update_attributes(kishi_id: id.to_i)
        end
      end
    end
  end

  Rails.logger.level = 0
  ""
end

def self.update_player(category, name_ja, kishi_id, rank, url, retired)
  return if retired == false && rank < -2
  player = Player.find_or_create(name_ja)
  if (retired)
    player.update_attributes(retired: true) if player.retired == false
  else
    player.update_attributes(category: category, kishi_id: kishi_id, rank: rank, url: url) if (player.category != category || player.rank == nil || player.rank < rank)
  end
end

def load_JSA_detail
  Rails.logger.level = 3
  puts sprintf("Loading %s ...", self.search_key)
  response = open(to_jsa_url).read
  lines = response.split("\n")
  mode = -1
  lines.each do |line|
    next if line == ""
    if mode < 0
      if line == '<main id="main">'
        mode = 0
      else
        next
      end
    end
    if mode == 0
      if line =~ /生年月日/
        mode = 1
      elsif line =~ /\>師匠\</
        mode = 2
      elsif line =~/\>棋士番号\</
        mode = 3
      elsif line == '</main>'
        mode = -1
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
        if line =~ /\<td\>(\d+)\<\/td\>/
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
    self.kishi_id ? ("http://www.shogi.or.jp/player/pro/" + self.kishi_id.to_s + ".html") : ""
  elsif self.category == 2
    self.kishi_id ? ("http://www.shogi.or.jp/player/lady/" + self.kishi_id.to_s + ".html") : ""
  else
    ""
  end
end

def to_image_url
  if self.category == 1
    self.kishi_id ? ("http://www.shogi.or.jp/images/player/pro/" + self.kishi_id.to_s + ".jpg") : ""
  elsif self.category == 2
    self.kishi_id ? ("http://www.shogi.or.jp/images/player/lady/" + self.kishi_id.to_s + ".jpg") : ""
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
