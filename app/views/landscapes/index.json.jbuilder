json.array!(@landscapes) do |landscape|
  json.extract! landscape, :latitude, :longitude, :name, :details
  json.url landscape_url(landscape, format: :json)
end
