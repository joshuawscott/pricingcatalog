class Cost < ActiveRecord::Base
  acts_as_paranoid
  validates_presence_of :product_id
  belongs_to :product
end
