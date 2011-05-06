require "spec_helper"

describe UserLocationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/user_locations" }.should route_to(:controller => "user_locations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/user_locations/new" }.should route_to(:controller => "user_locations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/user_locations/1" }.should route_to(:controller => "user_locations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/user_locations/1/edit" }.should route_to(:controller => "user_locations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/user_locations" }.should route_to(:controller => "user_locations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/user_locations/1" }.should route_to(:controller => "user_locations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/user_locations/1" }.should route_to(:controller => "user_locations", :action => "destroy", :id => "1")
    end

  end
end
