require 'spec_helper'

describe "costs/index" do
  before(:each) do
    assign(:costs, [
      stub_model(Cost,
        :price => "9.99",
        :product => nil
      ),
      stub_model(Cost,
        :price => "9.99",
        :product => nil
      )
    ])
  end

  it "renders a list of costs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
