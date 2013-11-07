require 'spec_helper'

describe "Products" do
  describe "GET /products" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get products_path
      response.status.should be(200)
    end
  end

  describe "price_lookup" do
    let!(:product) { Product.create! product_number: 'AB101A', description: 'MyCoolProduct'}
    let!(:list_price) { ListPrice.create! price: 10.00 }
    let!(:product2) { Product.create! product_number: 'AB102A', description: 'MyCoolProduct2'}
    let!(:list_price2) { ListPrice.create! price: 20.00 }
    before do
      product.list_prices = [list_price]
      product2.list_prices = [list_price2]
      [product,product2].each {|p| p.save}
    end

    it 'returns a single product' do
      get price_lookup_products_path(format: :json, pn: 'AB101A')
      expect(response.body).to eq [{product_number: 'AB101A', description: 'MyCoolProduct', list_price: 10.00}].to_json
    end

    it 'returns mutliple products' do
      get price_lookup_products_path(format: :json, pn: 'AB101A,AB102A')
      expect(response.body).to eq(
        [{product_number: 'AB101A', description: 'MyCoolProduct', list_price: 10.00 },
         {product_number: 'AB102A', description: 'MyCoolProduct2', list_price: 20.00}].to_json)
    end

  end
end

