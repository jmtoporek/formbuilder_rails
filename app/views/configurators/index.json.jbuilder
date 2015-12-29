json.array!(@configurators) do |configurator|
  json.extract! configurator, :id, :name
  json.url configurator_url(configurator, format: :json)
end
