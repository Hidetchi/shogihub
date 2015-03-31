module WebsitesHelper
  def website_contents_td_tag(yes)
    if yes
      raw("<td style='background-color: #cfa'>")
    else
      raw("<td style='color:#888'>")
    end
  end
end
