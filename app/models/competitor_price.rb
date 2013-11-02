class CompetitorPrice < Price
  validates_presence_of :price
  belongs_to :product
end
