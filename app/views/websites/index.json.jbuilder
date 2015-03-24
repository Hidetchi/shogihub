json.array!(@websites) do |website|
  json.extract! website, :id, :name, :url, :owner, :description, :country_id, :language_id, :scale, :frequency, :contents_introduction, :contents_news_internal, :contents_news_external, :contents_forum, :contents_lesson, :contents_database, :contents_shop
  json.url website_url(website, format: :json)
end
