require 'spec_helper'

describe "products/edit" do
  before :each do
    @product = assign(:product, stub_model(Product,
      :product_number => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_product_number[name=?]", "product[product_number]"
      assert_select "input#product_description[name=?]", "product[description]"
    end
  end
end
