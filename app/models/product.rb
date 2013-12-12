class Product < ActiveRecord::Base
  acts_as_paranoid

  has_many :list_prices, dependent: :destroy, inverse_of: :product
  has_many :competitor_prices, dependent: :destroy, inverse_of: :product
  has_many :costs, dependent: :destroy

  validates_presence_of :product_number
  validates_presence_of :description
  validates_uniqueness_of :product_number, case_sensitive: false

  accepts_nested_attributes_for :list_prices
  accepts_nested_attributes_for :competitor_prices
  accepts_nested_attributes_for :costs

  def current_list_price
    list_prices.order(:valid_date).last || NullPrice.new
  end

  def current_cost
    costs.order(:valid_date).last
  end

  def self.update_from_salesforce
    if Product.count == 0
      query = "IsActive = true"
    else
      time = Product.pluck(:updated_at).max
      last_update = DateTime.new time.year, time.month, time.day, time.hour, time.min, time.sec
      query = "LastModifiedDate > #{last_update} AND IsActive = true"
    end
    Salesforce.client.materialize("Product2")
    sf_products = Salesforce.all_pages(Product2.query(query))
    sf_products.reject {|p| p.ProductCode.blank? || p.Description.blank?}.each do |sf_product|
      match = Product.where(product_number: sf_product.ProductCode).first
      if match
        match.update_attributes sf_to_rails(sf_product)
      else
        Product.create sf_to_rails(sf_product)
      end
    end
  end

  # returns a hash
  def self.sf_to_rails(sf_product)
    { product_number: sf_product.ProductCode,
      description:    sf_product.Description.to_s[0..250] }
  end

  class NullPrice
    def price
      0
    end
  end
end
