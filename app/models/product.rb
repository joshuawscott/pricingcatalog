class Product < ActiveRecord::Base
  has_many :list_prices
  has_many :competitor_prices
end
