module PlayersHelper

def player_name_tag(player)
  if player == nil
    ""
  elsif player.category == 1
    link_to(player.to_s, player_path(player), style:'text-decoration:none;')
  else
    player.to_s
  end
end

end
