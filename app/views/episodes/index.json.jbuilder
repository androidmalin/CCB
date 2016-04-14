json.array!(@episodes) do |episode|
  json.extract! episode, :id, :name, :img_url
  json.url episode_url(episode, format: :json)
end
