json.array!(@books) do |book|
  json.extract! book, :id, :isbn, :language_id, :title, :author, :publisher, :issue_date, :translator, :url, :image_url, :category, :description, :stars
  json.url book_url(book, format: :json)
end
