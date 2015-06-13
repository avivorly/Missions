json.array!(@axis_events) do |axis_event|
  json.extract! axis_event, :id, :rank, :description
  json.url axis_event_url(axis_event, format: :json)
end
