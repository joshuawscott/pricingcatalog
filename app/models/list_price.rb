class ListPrice < Price
  belongs_to :product, inverse_of: :list_prices
  validates_presence_of :price
  validates_presence_of :product
  scope :recent, ->(n=10) {order('valid_date DESC').limit(n)}

end
