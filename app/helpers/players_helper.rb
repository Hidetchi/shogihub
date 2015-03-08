module PlayersHelper

def player_name_tag(player)
  if player == nil
    ""
  elsif player.category == 1
    link_to(player.to_s, player_path(player), class: 'player_name', name: player.to_image_url)
  else
    player.to_s
  end
end

end
