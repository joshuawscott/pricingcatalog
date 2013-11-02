class Product < ActiveRecord::Base
  has_many :list_prices
  has_many :competitor_prices
  has_many :costs
  validates_presence_of :product_number
  validates_presence_of :description

  def current_list_price
    list_prices.order(:valid_date).last
  end

  def current_cost
    costs.order(:valid_date).last
  end
end
