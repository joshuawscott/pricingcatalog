class CompetitorPrice < Price
  belongs_to :product, inverse_of: :competitor_prices
  validates_presence_of :product_id
  validates_presence_of :price
  scope :recent, ->(n=10) {order('valid_date DESC').limit(n)}
end
