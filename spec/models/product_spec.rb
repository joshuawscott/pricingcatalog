require 'spec_helper'

describe Product do
  it { should have_many(:list_prices) }
  it { should have_many(:competitor_prices) }
  it { should have_many(:costs) }
  it { should validate_presence_of(:product_number) }
  it { should validate_presence_of(:description) }

  let(:valid_attributes) { {product_number: "MyProductNumber", description: "MyDescription"} }
  let(:list_price_valid_attributes) { {price: 10.00} }
  let(:cost_valid_attributes) { {price: 10.00} }
  let(:product) { Product.create! valid_attributes }
  let(:list_price) { ListPrice.create! list_price_valid_attributes }
  describe 'list_prices' do
    it 'finds the list prices' do
      product.list_prices = [list_price]
      expect(product.list_prices).to eq [list_price]
    end
  end
  describe 'current_list_price' do
    let(:lp1) {ListPrice.create(list_price_valid_attributes.merge valid_date: 3.days.ago)}
    let(:current_lp) {ListPrice.create(list_price_valid_attributes.merge valid_date: 1.days.ago)}
    let(:lp3) {ListPrice.create(list_price_valid_attributes.merge valid_date: 2.days.ago)}
    before{ product.list_prices = [lp1, current_lp, lp3] }

    it "finds the last list price by date" do
      expect(product.current_list_price).to eq current_lp
    end
  end

  describe 'current_cost' do
    let(:cost1) {Cost.create(cost_valid_attributes.merge valid_date: 3.days.ago)}
    let(:current_cost) {Cost.create(cost_valid_attributes.merge valid_date: 1.days.ago)}
    let(:cost3) {Cost.create(cost_valid_attributes.merge valid_date: 2.days.ago)}
    before{ product.costs = [cost1, current_cost, cost3] }

    it "finds the last cost by date" do
      expect(product.current_cost).to eq current_cost
    end
  end

end
