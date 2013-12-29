require 'spec_helper'

describe "ListPrices" do
  before { sign_in_as_a_user }
  describe "GET /list_prices" do
    it "is successful" do
      get list_prices_path
      response.status.should be(200)
    end
  end
end
