require 'spec_helper'

describe "list_prices/index" do
  before :each do
    assign(:list_prices, [
      stub_model(ListPrice,
        :price => "9.99",
        :product => mock_model(Product, product_number: "ABC123")
      ),
      stub_model(ListPrice,
        :price => "9.99",
        :product => mock_model(Product, product_number: "ABC123")
      )
    ])
  end

  it "renders a list of list_prices" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "ABC123".to_s, :count => 2
  end
end
