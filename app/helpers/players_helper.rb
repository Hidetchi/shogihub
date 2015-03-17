module PlayersHelper

def player_name_tag(player)
  if player == nil
    ""
  elsif (player.category == 1 || player.category == 2)
    link_to(player.to_s, player_path(player), class: 'player_name', name: player.to_image_url)
  else
    player.to_s
  end
end

def family_tree(players)
  return "" if players.length == 0
  html = "<ul>"
  players.each do |p|
    next if (p.teacher_id == nil && p.pupils.length == 0)
    html += "<li>" + player_name_tag(p)
    pupils = p.pupils.order(:category, :kishi_id, :birthday)
    html += family_tree(pupils)
  end
  html += "</ul>"
  raw(html)
end

end
