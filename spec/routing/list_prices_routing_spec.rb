require "spec_helper"

describe ListPricesController do
  describe "routing" do

    it "routes to #index" do
      get("/list_prices").should route_to("list_prices#index")
    end

    it "routes to #new" do
      get("/list_prices/new").should route_to("list_prices#new")
    end

    it "routes to #show" do
      get("/list_prices/1").should route_to("list_prices#show", :id => "1")
    end

    it "routes to #edit" do
      get("/list_prices/1/edit").should route_to("list_prices#edit", :id => "1")
    end

    it "routes to #create" do
      post("/list_prices").should route_to("list_prices#create")
    end

    it "routes to #update" do
      put("/list_prices/1").should route_to("list_prices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/list_prices/1").should route_to("list_prices#destroy", :id => "1")
    end

  end
end
