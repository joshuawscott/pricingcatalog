require 'spec_helper'

describe "costs/show" do
  before :each do
    @cost = assign(:cost, stub_model(Cost,
      :price => "9.99",
      :product => stub_model(Product, description: "MyProduct")
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/9.99/)
    rendered.should match(/MyProduct/)
  end
end
