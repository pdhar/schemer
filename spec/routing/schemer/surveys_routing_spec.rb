require "spec_helper"

module Schemer
  describe SurveysController do
    describe "routing" do

      routes { Schemer::Engine.routes }

      it "routes to #index" do
        get("/surveys").should route_to("schemer/surveys#index")
      end

      it "routes to #new" do
        get("/surveys/new").should route_to("schemer/surveys#new")
      end

      it "routes to #show" do
        get("/surveys/1").should route_to("schemer/surveys#show", :id => "1")
      end

      it "routes to #edit" do
        get("/surveys/1/edit").should route_to("schemer/surveys#edit", :id => "1")
      end

      it "routes to #create" do
        post("/surveys").should route_to("schemer/surveys#create")
      end

      it "routes to #update" do
        put("/surveys/1").should route_to("schemer/surveys#update", :id => "1")
      end

      it "routes to #destroy" do
        delete("/surveys/1").should route_to("schemer/surveys#destroy", :id => "1")
      end

    end
  end
end
