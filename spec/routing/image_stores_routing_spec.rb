require "spec_helper"

describe ImageStoresController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/image_stores" }.should route_to(:controller => "image_stores", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/image_stores/new" }.should route_to(:controller => "image_stores", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/image_stores/1" }.should route_to(:controller => "image_stores", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/image_stores/1/edit" }.should route_to(:controller => "image_stores", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/image_stores" }.should route_to(:controller => "image_stores", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/image_stores/1" }.should route_to(:controller => "image_stores", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/image_stores/1" }.should route_to(:controller => "image_stores", :action => "destroy", :id => "1")
    end

  end
end
