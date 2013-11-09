require 'spec_helper'

describe "Costs" do
  describe "GET /costs" do
    it "is successful" do
      get costs_path
      response.status.should be(200)
    end
  end
end
