require 'spec_helper'

describe "competitor_prices/new" do
  before :each do
    assign(:competitor_price, stub_model(CompetitorPrice,
      :price => "9.99",
      :product => nil
    ).as_new_record)
  end

  it "renders new competitor_price form" do
    render

    assert_select "form[action=?][method=?]", competitor_prices_path, "post" do
      assert_select "select#competitor_price_product_id[name=?]", "competitor_price[product_id]"
    end
  end
end
