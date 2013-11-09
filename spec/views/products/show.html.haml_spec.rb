require 'spec_helper'

describe "products/show" do
  before :each do
    @product = assign(:product, stub_model(Product,
      :product_number => "MyProduct Number",
      :description => "MyDescription",
      :current_list_price => mock_model(ListPrice, price: 9.99)

    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/MyProduct Number/)
    rendered.should match(/MyDescription/)
    rendered.should match(/9.99/)
  end
end
