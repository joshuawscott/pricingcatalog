require 'spec_helper'

describe "competitor_prices/edit" do
  before(:each) do
    @competitor_price = assign(:competitor_price, stub_model(CompetitorPrice,
      :price => "9.99",
      :product => nil
    ))
  end

  it "renders the edit competitor_price form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", competitor_price_path(@competitor_price), "post" do
      assert_select "input#competitor_price_price[name=?]", "competitor_price[price]"
      assert_select "select#competitor_price_product_id[name=?]", "competitor_price[product_id]"
    end
  end
end
