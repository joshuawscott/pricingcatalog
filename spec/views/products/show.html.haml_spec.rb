require 'spec_helper'

describe "products/show" do
  before :each do
    @product = assign(:product, stub_model(Product,
      :product_number => "MyProduct Number",
      :description => "MyDescription"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/MyProduct Number/)
    rendered.should match(/MyDescription/)
  end
end
