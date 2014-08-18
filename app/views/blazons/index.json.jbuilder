json.array!(@blazons) do |blazon|
  json.extract! blazon, :id
  json.url blazon_url(blazon, format: :json)
end
