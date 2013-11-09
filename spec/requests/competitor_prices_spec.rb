require 'spec_helper'

describe "CompetitorPrices" do
  describe "GET /competitor_prices" do
    it "is successful" do
      get competitor_prices_path
      response.status.should be(200)
    end
  end
end
