require "spec_helper"

describe CompetitorPricesController do
  describe "routing" do

    it "routes to #index" do
      get("/competitor_prices").should route_to("competitor_prices#index")
    end

    it "routes to #new" do
      get("/competitor_prices/new").should route_to("competitor_prices#new")
    end

    it "routes to #show" do
      get("/competitor_prices/1").should route_to("competitor_prices#show", :id => "1")
    end

    it "routes to #edit" do
      get("/competitor_prices/1/edit").should route_to("competitor_prices#edit", :id => "1")
    end

    it "routes to #create" do
      post("/competitor_prices").should route_to("competitor_prices#create")
    end

    it "routes to #update" do
      put("/competitor_prices/1").should route_to("competitor_prices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/competitor_prices/1").should route_to("competitor_prices#destroy", :id => "1")
    end

  end
end
