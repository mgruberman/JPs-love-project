require "spec_helper"

describe FavoriteShopsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/favorite_shops" }.should route_to(:controller => "favorite_shops", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/favorite_shops/new" }.should route_to(:controller => "favorite_shops", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/favorite_shops/1" }.should route_to(:controller => "favorite_shops", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/favorite_shops/1/edit" }.should route_to(:controller => "favorite_shops", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/favorite_shops" }.should route_to(:controller => "favorite_shops", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/favorite_shops/1" }.should route_to(:controller => "favorite_shops", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/favorite_shops/1" }.should route_to(:controller => "favorite_shops", :action => "destroy", :id => "1")
    end

  end
end
