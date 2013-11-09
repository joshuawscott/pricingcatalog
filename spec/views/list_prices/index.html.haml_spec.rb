require 'spec_helper'

describe "list_prices/index" do
  before :each do
    assign(:list_prices, [
      stub_model(ListPrice,
        :price => "9.99"
      ),
      stub_model(ListPrice,
        :price => "9.99"
      )
    ])
  end

  it "renders a list of list_prices" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
