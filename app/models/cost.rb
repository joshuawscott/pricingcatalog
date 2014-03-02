class Cost < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :product, inverse_of: :costs
  validates_presence_of :product_id
  validates_presence_of :price
  scope :recent, ->(n=10) {order('valid_date DESC').limit(n)}

  def self.create_from_sf(product_id, sf_product)
    if sf_product.SVMXC__Product_Cost__c
      self.create(
          price: sf_product.SVMXC__Product_Cost__c,
          valid_date: sf_product.LastModifiedDate,
          product_id: product_id
      )
    else
      false
    end
  end

end
