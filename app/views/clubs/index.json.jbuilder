json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :country_id, :address, :latitude, :longitude, :scale, :frequency
  json.url club_url(club, format: :json)
end
