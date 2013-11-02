require 'spec_helper'

describe "competitor_prices/new" do
  before(:each) do
    assign(:competitor_price, stub_model(CompetitorPrice,
      :price => "9.99",
      :product => nil
    ).as_new_record)
  end

  it "renders new competitor_price form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", competitor_prices_path, "post" do
      assert_select "select#competitor_price_product[name=?]", "competitor_price[product]"
    end
  end
end
