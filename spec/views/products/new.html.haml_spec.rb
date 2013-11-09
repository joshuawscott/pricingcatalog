require 'spec_helper'

describe "products/new" do
  before :each do
    assign(:product, stub_model(Product,
      product_number: "MyString",
      description: "MyString"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input#product_product_number[name=?]", "product[product_number]"
      assert_select "input#product_description[name=?]", "product[description]"
    end
  end
end
