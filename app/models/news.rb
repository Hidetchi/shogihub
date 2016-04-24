class News < ActiveRecord::Base
  include PublicActivity::Common

  def self.fetch_from_JSA
    url = 'http://www.shogi.or.jp/topics/atom.xml'
    feed = Feedjira::Feed.fetch_and_parse url
    feed.entries.reverse.each do |e|
      unless (News.find_by(entry_id: e.entry_id))
        category = e.categories =~ /お知らせ/ ? 1 : 2
        if (news = News.create(entry_id: e.entry_id, url: e.url, published_at: e.published, title_ja: e.title, title_en: e.title, content_ja: e.content, content_en: e.content, category: category))
          puts news.entry_id.to_s
        end
      end
    end
  end
end
