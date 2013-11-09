class Product < ActiveRecord::Base
  acts_as_paranoid
  has_many :list_prices, dependent: :destroy
  has_many :competitor_prices, dependent: :destroy
  has_many :costs, dependent: :destroy
  validates_presence_of :product_number
  validates_presence_of :description

  def current_list_price
    list_prices.order(:valid_date).last
  end

  def current_cost
    costs.order(:valid_date).last
  end
end
