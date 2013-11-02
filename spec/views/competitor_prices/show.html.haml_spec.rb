require 'spec_helper'

describe "competitor_prices/show" do
  before(:each) do
    @competitor_price = assign(:competitor_price, stub_model(CompetitorPrice,
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
