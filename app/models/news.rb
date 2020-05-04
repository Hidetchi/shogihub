class News < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :translator, class_name: 'User'
  belongs_to :proofreader, class_name: 'User'
  has_many :likes

  def self.fetch_from_JSA
    url = 'http://www.shogi.or.jp/atom.xml'
    feed = Feedjira::Feed.fetch_and_parse url
    feed.entries.reverse.each do |e|
      to_load = false
      e.categories.each do |category|
        if ["イベント", "メディア出演情報", "棋士・棋戦", "女流棋戦", "観戦記情報", "大盤解説会情報"].include?(category)
          to_load = false
          break
        elsif ["お知らせ", "日本将棋連盟からのお知らせ", "棋戦"].include?(category)
          to_load = true
        elsif ["昇段・昇級", "キリ勝数", "棋界ニュース"].include?(category)
          to_load = true
          break
        end
      end
      to_load = true if e.content.include?("81dojo") || e.content.include?("海外")
      next unless to_load
      unless (News.find_by(entry_id: e.entry_id))
        category = 1
        News.create(entry_id: e.entry_id, url: e.url, published_at: e.published, title_ja: e.title, title_en: e.title, content_ja: e.content, content_en: e.content, category: category)
      end
    end
  end

  def open?
    status == 3
  end

  def like(user, anonymous_token)
    if user.present?
      self.likes.find_or_create_by(user: user)
    elsif anonymous_token.present?
      self.likes.find_or_create_by(anonymous_id: anonymous_token)
    end
  end

  def liked?(user, anonymous_token)
    if user.present?
      self.likes.where(user: user).exists?
    elsif anonymous_token.present?
      self.likes.where(anonymous_id: anonymous_token).exists?
    else
      false
    end
  end

  def likes_count
    self.likes.count
  end

  def og_image_url
    if content_en.match(/\<img\s[^\>]+\ssrc\="(http[^"]+)"/)
      $1
    else
      nil
    end
  end
end
