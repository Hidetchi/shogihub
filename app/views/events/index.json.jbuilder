json.array!(@events) do |event|
  json.extract! event, :id, :name, :start_time, :end_time, :country_id, :venue, :address, :latitude, :longitude, :organizer, :url, :report_url, :contact, :description, :type, :canceled
  json.url event_url(event, format: :json)
end
