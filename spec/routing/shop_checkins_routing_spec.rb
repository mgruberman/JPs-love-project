require "spec_helper"

describe ShopCheckinsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/shop_checkins" }.should route_to(:controller => "shop_checkins", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/shop_checkins/new" }.should route_to(:controller => "shop_checkins", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/shop_checkins/1" }.should route_to(:controller => "shop_checkins", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/shop_checkins/1/edit" }.should route_to(:controller => "shop_checkins", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/shop_checkins" }.should route_to(:controller => "shop_checkins", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/shop_checkins/1" }.should route_to(:controller => "shop_checkins", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/shop_checkins/1" }.should route_to(:controller => "shop_checkins", :action => "destroy", :id => "1")
    end

  end
end
