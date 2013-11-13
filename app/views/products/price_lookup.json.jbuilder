json.products do
  json.array!(@products) do |product|
    json.extract! product, :product_number, :description
    json.set! :list_price, product.current_list_price.price.to_f
  end
end
if @missing_product_numbers.present?
  json.not_found do
    json.array!(@missing_product_numbers)
  end
end
