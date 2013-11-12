class ListPrice < Price
  belongs_to :product, inverse_of: :list_prices
  validates_presence_of :price
  validates_presence_of :product
end
