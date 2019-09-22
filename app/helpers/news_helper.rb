module NewsHelper
  def news_category_tag(news)
    case news.category
    when 0
      image_tag 'news_icon_shogihub.png', style: 'vertical-align: middle;margin-right:3px'
    when 1, 2
      image_tag 'news_icon_jsa.png', style: 'vertical-align: middle;margin-right:3px'
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

  def render_news_status(news)
    if news.status == 0 && news.translator.present?
      "Assigned"
    elsif news.status == 1
      content_tag(:span, "Submitted", style:'color:orangered;font-weight:bold')
    elsif news.status == 2
      content_tag(:span, "Approved", style:'color:mediumseagreen;font-weight:bold')
    elsif news.status == 3
      content_tag(:span, "Published", style:'color:white;background:forestgreen;padding:0 5px')
    end
  end

end
