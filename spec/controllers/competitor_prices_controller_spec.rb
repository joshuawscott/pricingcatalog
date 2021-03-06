require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CompetitorPricesController do
  before {sign_in}

  # This should return the minimal set of attributes required to create a valid
  # CompetitorPrice. As you add validations to CompetitorPrice, be sure to
  # adjust the attributes here as well.
  let(:product) {Product.create product_number: "AB101A", description: "MyDescription"}
  let(:valid_attributes) { {"price" => "9.99", "product_id" => product.id.to_s} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompetitorPricesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all competitor_prices as @competitor_prices" do
      competitor_price = CompetitorPrice.create! valid_attributes
      get :index, {}, valid_session
      assigns(:competitor_prices).should eq([competitor_price])
    end
  end

  describe "GET show" do
    it "assigns the requested competitor_price as @competitor_price" do
      competitor_price = CompetitorPrice.create! valid_attributes
      get :show, {:id => competitor_price.to_param}, valid_session
      assigns(:competitor_price).should eq(competitor_price)
    end
  end

  describe "GET new" do
    it "assigns a new competitor_price as @competitor_price" do
      get :new, {}, valid_session
      assigns(:competitor_price).should be_a_new(CompetitorPrice)
    end
  end

  describe "GET edit" do
    it "assigns the requested competitor_price as @competitor_price" do
      competitor_price = CompetitorPrice.create! valid_attributes
      get :edit, {:id => competitor_price.to_param}, valid_session
      assigns(:competitor_price).should eq(competitor_price)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CompetitorPrice" do
        expect {
          post :create, {:competitor_price => valid_attributes}, valid_session
        }.to change(CompetitorPrice, :count).by(1)
      end

      it "assigns a newly created competitor_price as @competitor_price" do
        post :create, {competitor_price: valid_attributes}, valid_session
        assigns(:competitor_price).should be_a(CompetitorPrice)
        assigns(:competitor_price).should be_persisted
      end

      it "redirects to the associated product" do
        post :create, {competitor_price: valid_attributes}, valid_session
        response.should redirect_to(CompetitorPrice.last.product)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved competitor_price as @competitor_price" do
        # Trigger the behavior that occurs when invalid params are submitted
        CompetitorPrice.any_instance.stub(:save).and_return(false)
        post :create, {competitor_price: {price: ''}}, valid_session
        assigns(:competitor_price).should be_a_new(CompetitorPrice)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CompetitorPrice.any_instance.stub(:save).and_return(false)
        post :create, {competitor_price: {price: ''}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested competitor_price" do
        competitor_price = CompetitorPrice.create! valid_attributes
        # Assuming there are no other competitor_prices in the database, this
        # specifies that the CompetitorPrice created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CompetitorPrice.any_instance.should_receive(:update).with({"price" => ""})
        put :update, {:id => competitor_price.to_param, :competitor_price => {price: ''}}, valid_session
      end

      it "assigns the requested competitor_price as @competitor_price" do
        competitor_price = CompetitorPrice.create! valid_attributes
        put :update, {:id => competitor_price.to_param, :competitor_price => valid_attributes}, valid_session
        assigns(:competitor_price).should eq(competitor_price)
      end

      it "redirects to the competitor_price" do
        competitor_price = CompetitorPrice.create! valid_attributes
        put :update, {id: competitor_price.to_param, competitor_price: valid_attributes}, valid_session
        response.should redirect_to(competitor_price)
      end
    end

    describe "with invalid params" do
      it "assigns the competitor_price as @competitor_price" do
        competitor_price = CompetitorPrice.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CompetitorPrice.any_instance.stub(:save).and_return(false)
        put :update, {:id => competitor_price.to_param, :competitor_price => {price: ''}}, valid_session
        assigns(:competitor_price).should eq(competitor_price)
      end

      it "re-renders the 'edit' template" do
        competitor_price = CompetitorPrice.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CompetitorPrice.any_instance.stub(:save).and_return(false)
        put :update, {:id => competitor_price.to_param, :competitor_price => {price: ''}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested competitor_price" do
      competitor_price = CompetitorPrice.create! valid_attributes
      expect {
        delete :destroy, {:id => competitor_price.to_param}, valid_session
      }.to change(CompetitorPrice, :count).by(-1)
    end

    it "redirects to the competitor_prices list" do
      competitor_price = CompetitorPrice.create! valid_attributes
      delete :destroy, {:id => competitor_price.to_param}, valid_session
      response.should redirect_to(competitor_prices_url)
    end
  end

end
