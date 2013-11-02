require 'spec_helper'

describe "competitor_prices/index" do
  before(:each) do
    assign(:competitor_prices, [
      stub_model(CompetitorPrice,
        :price => "9.99"
      ),
      stub_model(CompetitorPrice,
        :price => "9.99"
      )
    ])
  end

  it "renders a list of competitor_prices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
