module WebsitesHelper
  def website_contents_td_tag(yes)
    if yes
      raw("<td style='background-color: #cfa'>")
    else
      raw("<td style='color:#888'>")
    end
  end

  def stars_tag(n)
    n = 0 if n < 0
    n = 3 if n > 3
    tag = ""
    n.times do
      tag += image_tag('star.gif', class:'star')
    end
    raw(tag)
  end
end
