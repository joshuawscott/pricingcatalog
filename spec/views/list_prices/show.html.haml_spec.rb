require 'spec_helper'

describe "list_prices/show" do
  before(:each) do
    @list_price = assign(:list_price, stub_model(ListPrice,
      :price => "9.99",
      :product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Price/)
    rendered.should match(/9.99/)
  end
end
