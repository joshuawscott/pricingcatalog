class ListPrice < Price
  belongs_to :product, inverse_of: :list_prices
  validates_presence_of :price
  validates_presence_of :product
  scope :recent, ->(n=10) {order('valid_date DESC').limit(n)}

  def self.create_from_sf(product_id, sf_product)
    if sf_product.OEM_24x7x4_P_L_1_Year_Price__c
      self.create(
          price: sf_product.OEM_24x7x4_P_L_1_Year_Price__c / 12.0,
          valid_date: sf_product.LastModifiedDate,
          product_id: product_id
      )
    else
      false
    end
  end
end
