require 'rails_helper'

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

RSpec.describe ConfiguratorsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Configurator. As you add validations to Configurator, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    #skip("Add a hash of attributes valid for your model")
    {name: "New configurator"}
  }

  let(:invalid_attributes) {
    #skip("Add a hash of attributes invalid for your model")
    {name: "", bogus: "invalid attribute"}
  }
  
  let(:new_attributes){
    {name: "Edited name"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ConfiguratorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all configurators as @configurators" do
      configurator = Configurator.create! valid_attributes
      c2 = create(:configurator)
      get :index, {}, valid_session
      expect(assigns(:configurators)).to eq([configurator,c2])
    end
  end

  describe "GET #show" do
    it "assigns the requested configurator as @configurator" do
      configurator = Configurator.create! valid_attributes
      get :show, {:id => configurator.to_param}, valid_session
      expect(assigns(:configurator)).to eq(configurator)
    end
  end

  describe "GET #new" do
    it "assigns a new configurator as @configurator" do
      get :new, {}, valid_session
      expect(assigns(:configurator)).to be_a_new(Configurator)
    end
  end

  describe "GET #edit" do
    it "assigns the requested configurator as @configurator" do
      configurator = Configurator.create! valid_attributes
      get :edit, {:id => configurator.to_param}, valid_session
      expect(assigns(:configurator)).to eq(configurator)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Configurator" do
        expect {
          post :create, {:configurator => valid_attributes}, valid_session
        }.to change(Configurator, :count).by(1)
      end

      it "assigns a newly created configurator as @configurator" do
        post :create, {:configurator => valid_attributes}, valid_session
        expect(assigns(:configurator)).to be_a(Configurator)
        expect(assigns(:configurator)).to be_persisted
      end

      it "redirects to the created configurator" do
        post :create, {:configurator => valid_attributes}, valid_session
        expect(response).to redirect_to(Configurator.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved configurator as @configurator" do
        post :create, {:configurator => invalid_attributes}, valid_session
        expect(assigns(:configurator)).to be_a_new(Configurator)
      end

      it "re-renders the 'new' template" do
        post :create, {:configurator => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "Edited name"}
      }

      it "updates the requested configurator" do
        configurator = Configurator.create! valid_attributes
        put :update, {:id => configurator.to_param, :configurator => new_attributes }, valid_session
        configurator.reload
        expect(configurator.name).to eq(new_attributes[:name])
      end

      it "assigns the requested configurator as @configurator" do
        configurator = Configurator.create! valid_attributes
        put :update, {:id => configurator.to_param, :configurator => valid_attributes}, valid_session
        expect(assigns(:configurator)).to eq(configurator)
      end

      it "redirects to the configurator" do
        configurator = Configurator.create! valid_attributes
        put :update, {:id => configurator.to_param, :configurator => valid_attributes}, valid_session
        expect(response).to redirect_to(configurator)
      end
    end

    context "with invalid params" do
      it "assigns the configurator as @configurator" do
        configurator = Configurator.create! valid_attributes
        put :update, {:id => configurator.to_param, :configurator => invalid_attributes}, valid_session
        expect(assigns(:configurator)).to eq(configurator)
      end

      it "re-renders the 'edit' template" do
        configurator = Configurator.create! valid_attributes
        put :update, {:id => configurator.to_param, :configurator => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested configurator" do
      configurator = Configurator.create! valid_attributes
      expect {
        delete :destroy, {:id => configurator.to_param}, valid_session
      }.to change(Configurator, :count).by(-1)
    end

    it "redirects to the configurators list" do
      configurator = Configurator.create! valid_attributes
      delete :destroy, {:id => configurator.to_param}, valid_session
      expect(response).to redirect_to(configurators_url)
    end
  end
  
  #under constuction
  describe "GET #preview" do
    it "shows the configurator preview" do
      configurator = Configurator.create! valid_attributes
      get :preview, {:id => configurator.id }, valid_session
      expect(assigns(:configurator)).to eq(configurator)
    end
  end

end
