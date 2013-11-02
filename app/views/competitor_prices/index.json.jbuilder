json.array!(@competitor_prices) do |competitor_price|
  json.extract! competitor_price, :type, :price, :valid_date, :product_id
  json.url competitor_price_url(competitor_price, format: :json)
end
