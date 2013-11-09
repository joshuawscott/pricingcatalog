class CompetitorPrice < Price
  validates_presence_of :price
  validates_presence_of :product_id
  belongs_to :product
end
