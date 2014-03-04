class Price < ActiveRecord::Base
  acts_as_paranoid
  def annual_price
    return if price.nil?
    price * 12
  end

end
