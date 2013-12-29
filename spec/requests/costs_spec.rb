require 'spec_helper'

describe "Costs" do
  before { sign_in_as_a_user }
  describe "GET /costs" do
    it "is successful" do
      get costs_path
      response.status.should be(200)
    end
  end
end
