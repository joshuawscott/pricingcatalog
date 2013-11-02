json.array!(@list_prices) do |list_price|
  json.extract! list_price, :type, :price, :valid_date, :product_id
  json.url list_price_url(list_price, format: :json)
end
