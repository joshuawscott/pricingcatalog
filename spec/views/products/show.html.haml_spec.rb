require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :product_number => "MyProduct Number",
      :description => "MyDescription"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyProduct Number/)
    rendered.should match(/MyDescription/)
  end
end
