require 'spec_helper'

describe "costs/index" do
  before :each do
    assign(:costs, [
      stub_model(Cost,
        :price => "9.99",
        :product => mock_model(Product, product_number: "ABC123")
      ),
      stub_model(Cost,
        :price => "9.99",
        :product => mock_model(Product, product_number: "ABC123")
      )
    ])
  end

  it "renders a list of costs" do
    render
    assert_select "tr>td", :text => "9.99", :count => 2
    assert_select "tr>td", :text => "ABC123", :count => 2
  end
end
