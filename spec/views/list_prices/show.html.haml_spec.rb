require 'spec_helper'

describe "list_prices/show" do
  before :each do
    @list_price = assign(:list_price, stub_model(ListPrice,
      :price => "9.99",
      :product => stub_model(Product, description: "MyProduct")
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/9.99/)
    rendered.should match(/MyProduct/)
  end
end
