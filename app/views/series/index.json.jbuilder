json.array!(@series) do |series|
  json.extract! series, :id, :name, :img_url
  json.url series_url(series, format: :json)
end
