require 'spec_helper'

describe "products/index" do
  before :each do
    assign(:products, [
      stub_model(Product,
        :product_number => "Product Number",
        :description => "Description"
      ),
      stub_model(Product,
        :product_number => "Product Number",
        :description => "Description"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Product Number".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
