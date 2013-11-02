require 'spec_helper'

describe "list_prices/edit" do
  before(:each) do
    @list_price = assign(:list_price, stub_model(ListPrice,
      :price => "9.99",
      :product => nil
    ))
  end

  it "renders the edit list_price form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", list_price_path(@list_price), "post" do
      assert_select "input#list_price_price[name=?]", "list_price[price]"
      assert_select "select#list_price_product[name=?]", "list_price[product]"
    end
  end
end
