module NewsHelper
  def news_category_tag(news)
    case news.category
    when 0
      image_tag 'news_icon_shogihub.png', style: 'vertical-align: middle'
    when 1, 2
      image_tag 'news_icon_jsa.png', style: 'vertical-align: middle'
    end
  end

  def interpreted_content(news, link_player = true)
    if news.content_en
      html = news.content_en.gsub(/\[\[(.+?)\|(.+?)\]\]/) {
        player = link_player ? Player.find_by(search_key: $1) : nil
        if (player && (player.category == 1 || player.category == 2))
          link_to($2, player_url(player), class: 'player_name', name: player.to_image_url)
        else
          $2
        end
      }
      html.html_safe
    else
      ""
    end
  end
end
