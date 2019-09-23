module PlayersHelper

def player_name_tag(player, ja = false)
  str = ja ? player.search_key : player.to_s
  if player == nil
    ""
  elsif (player.category == 1 || player.category == 2)
    link_to(str, player_path(player), class: 'player_name', name: player.to_image_url)
  else
    str
  end
end

end
