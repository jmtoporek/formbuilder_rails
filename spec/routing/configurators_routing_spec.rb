require "rails_helper"

RSpec.describe ConfiguratorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/configurators").to route_to("configurators#index")
    end

    it "routes to #new" do
      expect(:get => "/configurators/new").to route_to("configurators#new")
    end

    it "routes to #show" do
      expect(:get => "/configurators/1").to route_to("configurators#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/configurators/1/edit").to route_to("configurators#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/configurators").to route_to("configurators#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/configurators/1").to route_to("configurators#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/configurators/1").to route_to("configurators#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/configurators/1").to route_to("configurators#destroy", :id => "1")
    end

  end
end
