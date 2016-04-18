json.array!(@news) do |news|
  json.extract! news, :id, :entry_id, :url, :published_at, :title_ja, :title_en, :content_ja, :content_en, :category, :open
  json.url news_url(news, format: :json)
end
