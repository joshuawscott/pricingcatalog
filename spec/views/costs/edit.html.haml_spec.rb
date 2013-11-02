require 'spec_helper'

describe "costs/edit" do
  before(:each) do
    @cost = assign(:cost, stub_model(Cost,
      :price => "9.99",
      :product => nil
    ))
  end

  it "renders the edit cost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cost_path(@cost), "post" do
      assert_select "input#cost_price[name=?]", "cost[price]"
      assert_select "select#cost_product[name=?]", "cost[product]"
    end
  end
end
