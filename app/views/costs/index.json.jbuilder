json.array!(@costs) do |cost|
  json.extract! cost, :price, :valid_date, :product_id
  json.url cost_url(cost, format: :json)
end
