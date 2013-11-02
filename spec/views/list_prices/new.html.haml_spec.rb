require 'spec_helper'

describe "list_prices/new" do
  before(:each) do
    assign(:list_price, stub_model(ListPrice,
      :price => "9.99",
      :product => nil
    ).as_new_record)
  end

  it "renders new list_price form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", list_prices_path, "post" do
      assert_select "input#list_price_price[name=?]", "list_price[price]"
      assert_select "select#list_price_product[name=?]", "list_price[product]"
    end
  end
end
