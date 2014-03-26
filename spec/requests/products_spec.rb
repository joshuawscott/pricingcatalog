require 'spec_helper'

describe "Products" do
  context "normal" do
    before { sign_in_as_a_user }
    describe "GET /products" do
      it "is successful" do
        get products_path
        response.status.should be(200)
      end
    end
  end


  context "API" do
    describe "price_lookup" do
      let!(:product) { Product.create! product_number: 'AB101A', description: 'MyCoolProduct'}
      let!(:list_price) { ListPrice.create! price: 10.00, product: product, valid_date: '2011-12-01' }
      let!(:product2) { Product.create! product_number: 'AB102A', description: 'MyCoolProduct2'}
      let!(:list_price2) { ListPrice.create! price: 20.00, product: product2, valid_date: '2010-12-01' }
      before do
        product.list_prices = [list_price]
        product2.list_prices = [list_price2]
        [product,product2].each {|p| p.save}
      end

      it 'returns a single product' do
        get price_lookup_products_path(format: :json, pn: 'AB101A')
        expect(response.body).to eq({products: [{product_number: 'ab101a', description: 'MyCoolProduct', list_price: 10.00, cost: -1.0, competitor_price: -1.0}]}.to_json)
      end

      it 'returns mutliple products' do
        get price_lookup_products_path(format: :json, pn: 'AB101A,AB102A')
        expect(response.body).to eq({products:
                                     [{product_number: 'ab101a', description: 'MyCoolProduct', list_price: 10.00, cost: -1.0, competitor_price: -1.0 },
                                      {product_number: 'ab102a', description: 'MyCoolProduct2', list_price: 20.00, cost: -1.0, competitor_price: -1.0}]}.to_json)
      end

      it 'returns failures for nonexistent products' do
        get price_lookup_products_path(format: :json, pn: 'AB101A,AB102A,NOTFOUND')
        expect(response.body).to eq({products:
                                     [{product_number: 'ab101a', description: 'MyCoolProduct', list_price: 10.00, cost: -1.0, competitor_price: -1.0 },
                                      {product_number: 'ab102a', description: 'MyCoolProduct2', list_price: 20.00, cost: -1.0, competitor_price: -1.0}],
                                    not_found: ['notfound']}.to_json)

      end

      it 'returns failures when only nonexistent products' do
        get price_lookup_products_path(format: :json, pn: 'NOTFOUND')
        expect(response.body).to eq({products: [], not_found: ['notfound']}.to_json)
      end

    end
  end
end

