class Tournament < ActiveRecord::Base

def self.seed(search_key, name)
  if (tournament = Tournament.find_by(search_key: search_key))
    tournament.update_attributes(name: name)
  else
    Tournament.create(search_key: search_key, name: name)
  end
end

end
