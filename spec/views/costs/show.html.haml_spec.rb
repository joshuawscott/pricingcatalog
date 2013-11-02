require 'spec_helper'

describe "costs/show" do
  before(:each) do
    @cost = assign(:cost, stub_model(Cost,
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
