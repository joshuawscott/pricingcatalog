require 'spec_helper'

describe "list_prices/new" do
  before :each do
    assign(:list_price, stub_model(ListPrice,
      :price => "9.99",
      :product => nil
    ).as_new_record)
  end

  it "renders new list_price form" do
    render

    assert_select "form[action=?][method=?]", list_prices_path, "post" do
      assert_select "input#list_price_price[name=?]", "list_price[price]"
      assert_select "select#list_price_product_id[name=?]", "list_price[product_id]"
    end
  end
end
