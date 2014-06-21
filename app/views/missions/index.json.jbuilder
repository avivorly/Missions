json.array!(@missions) do |mission|
  json.extract! mission, :id, :title, :details, :done
  json.url mission_url(mission, format: :json)
end
