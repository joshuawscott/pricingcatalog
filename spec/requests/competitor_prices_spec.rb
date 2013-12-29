require 'spec_helper'

describe "CompetitorPrices" do
  before { sign_in_as_a_user }
  describe "GET /competitor_prices" do
    it "is successful" do
      get competitor_prices_path
      response.status.should be(200)
    end
  end
end
