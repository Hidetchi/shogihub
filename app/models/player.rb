require 'open-uri'

class Player < ActiveRecord::Base

belongs_to :alias, class_name: 'Player'
has_many :ghosts, class_name: 'Player', foreign_key: :alias_id
has_many :event_players
has_many :events, through: :event_players
has_ancestry

def self.find_or_create(name_ja)
  name_ja = name_ja.gsub(/・/,"")
  name_ja = name_ja.gsub(/眞/,"真").gsub(/髙/,"高").gsub(/﨑/,"崎")
  name_ja = name_ja.gsub(/^[KＫ]ステ/,"カロリーナステ")
  name_ja = '真田彩子' if name_ja == '古河彩子'
  name_ja = '上川香織' if name_ja == '松尾香織'
  unless (player = Player.find_by(search_key: name_ja))
    player = Player.create(search_key: name_ja)
    puts sprintf("New player %s created!", name_ja)
  end
  player.alias.present? ? player.alias : player
end

def self.load_JSA_all
  Rails.logger.level = 3

  @active = false
  @retired = false
  @name_loaded = false
  response = ""
  response += open("https://www.shogi.or.jp/player/").read
  response += open("https://www.shogi.or.jp/player/lady.html").read
  response += open("https://www.shogi.or.jp/player/retirement.html").read
  response += open("https://www.shogi.or.jp/player/deceased.html").read
#  response += "#INTAI_START\n"
#  response += open("http://www.shogi.or.jp/player/retirement.html").read
  lines = response.force_encoding("utf-8").split("\n")
  lines.each do |line|
    @active = true if line == '<main id="main">'
    @active = false if line == '</main>'
    next if !@active
    @retired = true if line == '<h2 class="headingElementsA01">引退棋士</h2>'
    if line =~ /\<a\shref\=\"\/player\/(pro|lady)\/(\d+)\.html\"\>(.+?)\<\/a\>/
      @name_loaded = true
      @player_type = $1
      @id = $2
      @name = $3.gsub(/[\s　]/,"")
    elsif @name_loaded && line =~ /\<p\>(.+)\<\/p\>/
      @name_loaded = false
      rank_text = $1
      if rank_text =~ /\A(女流)?([１２３初二三四五六七八九])([段級])\z/
        num_text = $2
        rank_type = $3
        if num_text == "１"
          rank = -1
        elsif num_text == "２"
          rank = -2
        elsif num_text == "３"
          rank = -3
        else
          rank = [0, "初", "二", "三", "四", "五", "六", "七", "八", "九"].index(num_text)
        end
      else
        rank = @retired ? 10 : 9
      end
      if rank >= -2
        Player.update_player(@player_type == 'pro' ? 1 : 2, @name, @id, rank, nil, @retired)
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
    player.update_attributes(retired: true, rank: rank) if player.retired == false || player.rank < rank
  else
    player.update_attributes(category: category, kishi_id: kishi_id, rank: rank, url: url) if (player.category != category || player.rank == nil || player.rank < rank)
  end
end

def load_JSA_detail
  Rails.logger.level = 3
  puts sprintf("Loading %s ...", self.search_key)
  response = open(to_jsa_url).read
  mode = -1
  lines = response.force_encoding("utf-8").split("\n")
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
      if line =~ /\A\<span\sclass\=\"jp\"\>(.+)\<\/span\>\z/
        mode = 1
      elsif line =~ /生年月日\<\/th\>\z/
        mode = 2
      elsif line =~ /師匠\<\/th\>\z/
        mode = 3
      elsif line == '</main>'
        mode = -1
      end
    else
      if mode == 1
        if self.name == nil
          if line =~ /\A\<span\sclass\=\"en\"\>(.+)\s(.+)\<\/span\>\z/
            self.name = $2 + ", " + $1
          end
        end
      elsif mode == 2
        if self.birthday == nil
          if line =~ /(\d+)年(\d+)月(\d+)日/
            self.birthday = Date.new($1.to_i, $2.to_i, $3.to_i)
          end
        end
      elsif mode == 3
        if line =~ /\<td\>(.+)\<\/td\>/
          if self.root?
            teacher_name = $1.gsub(/[（\(].+[）\)]/,"").gsub(/門下/,"").gsub(/[一二三四五六七八九十]+世名人/,"").gsub(/(名誉|永世|実力制).+$/,"").gsub(/[四五六七八九]段/,"").gsub(/[\s　]/,"")
            teacher = Player.find_or_create(teacher_name)
            self.parent = teacher
          end
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

def assign_alias_player(player)
  # All existing data and association of +self+ will be migrated to +player+, which becomes the main record
  # +self+ loses its data and will not be used. Further access to +self+ will be transferred to +player+ 
  return if player.nil? || self == player
  # Update association
  Game.where(sente: self).update_all(sente_id: player.id)
  Game.where(gote: self).update_all(gote_id: player.id)
  event_players.update_all(player_id: player.id)
  # Set alias_id to +self+ and all players ("ghosts") who had +self+ as the alias so far
  self.update(alias: player, category: 0, ancestry: nil)
  self.ghosts.each {|g| g.update(alias: player)}
end

def to_s
  self.name ? self.name : self.search_key
end

def to_rank
  return "" unless self.rank
  if self.rank == 10
    "Honorary title"
  else
    self.rank.abs.to_s + (self.rank > 0 ? "-Dan" : "-kyu")
  end
end

def to_jsa_url
  if self.category == 1
    self.kishi_id ? ("https://www.shogi.or.jp/player/pro/" + self.kishi_id.to_s + ".html") : ""
  elsif self.category == 2
    self.kishi_id ? ("https://www.shogi.or.jp/player/lady/" + self.kishi_id.to_s + ".html") : ""
  else
    ""
  end
end

def to_image_url
  if self.category == 1
    self.kishi_id ? ("https://www.shogi.or.jp/images/player/pro/" + self.kishi_id.to_s + ".jpg") : ""
  elsif self.category == 2
    self.kishi_id ? ("https://www.shogi.or.jp/images/player/lady/" + self.kishi_id.to_s + ".jpg") : ""
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
      hash[:parent_id] = teacher.id
    end

    if (player = Player.find_by(search_key: hash[:search_key]))
      player.update_attributes(hash)
    else
      Player.create(hash)
    end
  end
end

end
