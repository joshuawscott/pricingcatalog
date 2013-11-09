require 'spec_helper'

describe "competitor_prices/show" do
  before(:each) do
    @competitor_price = assign(:competitor_price, stub_model(CompetitorPrice,
      price: "9.99",
      product: mock_model(Product, description: 'MyProduct')
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/9.99/)
    rendered.should match(/MyProduct/)
  end
end
