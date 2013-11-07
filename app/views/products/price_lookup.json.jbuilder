json.array!(@products) do |product|
  json.extract! product, :product_number, :description
  json.set! :list_price, product.current_list_price.price.to_f
end
