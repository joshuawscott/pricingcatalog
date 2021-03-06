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

describe CostsController do

  before {sign_in}

  # This should return the minimal set of attributes required to create a valid
  # Cost. As you add validations to Cost, be sure to
  # adjust the attributes here as well.
  let(:product) {Product.create product_number: "AB101A", description: "MyDescription"}
  let(:valid_attributes) { { "price" => "9.99", "product_id" => product.id.to_s } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all costs as @costs" do
      cost = Cost.create! valid_attributes
      get :index, {}, valid_session
      assigns(:costs).should eq([cost])
    end
  end

  describe "GET show" do
    it "assigns the requested cost as @cost" do
      cost = Cost.create! valid_attributes
      get :show, {:id => cost.to_param}, valid_session
      assigns(:cost).should eq(cost)
    end
  end

  describe "GET new" do
    it "assigns a new cost as @cost" do
      get :new, {}, valid_session
      assigns(:cost).should be_a_new(Cost)
    end
  end

  describe "GET edit" do
    it "assigns the requested cost as @cost" do
      cost = Cost.create! valid_attributes
      get :edit, {:id => cost.to_param}, valid_session
      assigns(:cost).should eq(cost)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cost" do
        expect {
          post :create, {:cost => valid_attributes}, valid_session
        }.to change(Cost, :count).by(1)
      end

      it "assigns a newly created cost as @cost" do
        post :create, {:cost => valid_attributes}, valid_session
        assigns(:cost).should be_a(Cost)
        assigns(:cost).should be_persisted
      end

      it "redirects to the created cost's product" do
        post :create, {:cost => valid_attributes}, valid_session
        response.should redirect_to(Cost.last.product)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cost as @cost" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cost.any_instance.stub(:save).and_return(false)
        post :create, {:cost => { "price" => "invalid value" }}, valid_session
        assigns(:cost).should be_a_new(Cost)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cost.any_instance.stub(:save).and_return(false)
        post :create, {:cost => { "price" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cost" do
        cost = Cost.create! valid_attributes
        # Assuming there are no other costs in the database, this
        # specifies that the Cost created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Cost.any_instance.should_receive(:update).with({ "price" => "9.99" })
        put :update, {:id => cost.to_param, :cost => { "price" => "9.99" }}, valid_session
      end

      it "assigns the requested cost as @cost" do
        cost = Cost.create! valid_attributes
        put :update, {:id => cost.to_param, :cost => valid_attributes}, valid_session
        assigns(:cost).should eq(cost)
      end

      it "redirects to the cost" do
        cost = Cost.create! valid_attributes
        put :update, {:id => cost.to_param, :cost => valid_attributes}, valid_session
        response.should redirect_to(cost)
      end
    end

    describe "with invalid params" do
      it "assigns the cost as @cost" do
        cost = Cost.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Cost.any_instance.stub(:save).and_return(false)
        put :update, {:id => cost.to_param, :cost => { "price" => "invalid value" }}, valid_session
        assigns(:cost).should eq(cost)
      end

      it "re-renders the 'edit' template" do
        cost = Cost.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Cost.any_instance.stub(:save).and_return(false)
        put :update, {:id => cost.to_param, :cost => { "price" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cost" do
      cost = Cost.create! valid_attributes
      expect {
        delete :destroy, {:id => cost.to_param}, valid_session
      }.to change(Cost, :count).by(-1)
    end

    it "redirects to the costs list" do
      cost = Cost.create! valid_attributes
      delete :destroy, {:id => cost.to_param}, valid_session
      response.should redirect_to(costs_url)
    end
  end

end
