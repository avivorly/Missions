json.array!(@axes) do |axis|
  json.extract! axis, :id, :name
  json.url axis_url(axis, format: :json)
end
