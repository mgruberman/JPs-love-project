require "spec_helper"

describe BaristaController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/barista" }.should route_to(:controller => "barista", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/barista/new" }.should route_to(:controller => "barista", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/barista/1" }.should route_to(:controller => "barista", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/barista/1/edit" }.should route_to(:controller => "barista", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/barista" }.should route_to(:controller => "barista", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/barista/1" }.should route_to(:controller => "barista", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/barista/1" }.should route_to(:controller => "barista", :action => "destroy", :id => "1")
    end

  end
end
