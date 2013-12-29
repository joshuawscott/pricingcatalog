require 'spec_helper'
describe ApiProductsController do

  let(:valid_attributes) { { "product_number" => "MyProductNumber", "description" => "MyDescription" } }
  let(:valid_session) { {} }

  describe "GET price_lookup" do
    let(:product) {Product.create! valid_attributes.merge({product_number: 'AB101A'})}
    let(:product2) {Product.create! valid_attributes.merge({product_number: 'AB102A'})}
    let(:list_price) { ListPrice.create!({price: 10.00, product: product }) }
    let(:list_price2) { ListPrice.create!({price: 10.00, product: product2 }) }
    it "finds the product by product number" do
      expect(Product).to receive(:where).with({product_number: ['AB101A']})
      get :price_lookup, {format: 'json', pn: 'AB101A'}
    end
    it "finds multiple product numbers" do
      expect(Product).to receive(:where).with({product_number: ['AB101A','AB102A']})
      get :price_lookup, {format: 'json', pn: 'AB101A,AB102A'}
    end
  end
end
