json.array!(@products) do |product|
  json.extract! product, :product_number, :description, :source
  json.url product_url(product, format: :json)
end
