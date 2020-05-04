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
      html = news.content_en.gsub(/\[\[(.+?)\]\]/) {
        search_key = nil
        text = nil
        str = $1
        if str.match(/^(.+?)\|(.+?)$/)
          search_key = $1
          text = $2
        else
          search_key = str
        end
        player = Player.find_by(search_key: search_key)
        if player && player.name
          text = text || player.name.gsub(/,/, "")
        end
        if (link_player && player && (player.category == 1 || player.category == 2))
          link_to(text, player_url(player), class: 'player_name', name: player.to_image_url)
        else
          text || search_key
        end
      }
      html.html_safe
    else
      ""
    end
  end

  def render_news_status(news, show_default = false)
    if show_default && news.status == 0 && news.translator.nil?
      content_tag(:span, "Not assigned", style:'color:#aaa')
    elsif news.status == 0 && news.translator.present?
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
