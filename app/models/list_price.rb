class ListPrice < Price
  validates_presence_of :price
  validates_presence_of :product_id
end
