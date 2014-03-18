json.array!(@items) do |item|
  json.extract! item, :id, :title, :list, :points
  json.url item_url(item, format: :json)
end
