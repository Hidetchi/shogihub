class News < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :translator, class_name: 'User'

  def self.fetch_from_JSA
    url = 'http://www.shogi.or.jp/atom.xml'
    feed = Feedjira::Feed.fetch_and_parse url
    feed.entries.reverse.each do |e|
      to_load = false
      e.categories.each do |category|
        if ["イベント", "メディア情報", "棋戦", "女流棋戦"].include?(category)
          to_load = false
          break
        elsif category == "お知らせ"
          to_load = true
        elsif ["棋界ニュース", "昇段・昇級", "キリ勝数"].include?(category)
          to_load = true
          break
        end
      end
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
end
