module NewsHelper
  def news_category_tag(news)
    case news.category
    when 0
      image_tag 'news_icon_shogihub.png', style: 'vertical-align: middle'
    when 1, 2
      image_tag 'news_icon_jsa.png', style: 'vertical-align: middle'
    end
  end
end
