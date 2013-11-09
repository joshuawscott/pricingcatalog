require 'spec_helper'

describe "products/index" do
  before :each do
    assign(:products, [
      stub_model(Product,
        :product_number => "Product Number",
        :description => "Description",
        :current_list_price => mock_model(ListPrice, price: 9.99)

      ),
      stub_model(Product,
        :product_number => "Product Number",
        :description => "Description",
        :current_list_price => mock_model(ListPrice, price: 9.99)
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Product Number", :count => 2
    assert_select "tr>td", :text => "Description", :count => 2
    assert_select "tr>td", :text => "9.99", :count => 2
  end
end
