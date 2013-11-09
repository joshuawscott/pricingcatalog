require 'spec_helper'

describe "costs/new" do
  before :each do
    assign(:cost, stub_model(Cost,
      :price => "9.99",
      :product => nil
    ).as_new_record)
  end

  it "renders new cost form" do
    render

    assert_select "form[action=?][method=?]", costs_path, "post" do
      assert_select "input#cost_price[name=?]", "cost[price]"
      assert_select "select#cost_product_id[name=?]", "cost[product_id]"
    end
  end
end
