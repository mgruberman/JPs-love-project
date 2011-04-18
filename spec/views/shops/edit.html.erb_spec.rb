require 'spec_helper'

describe "shops/edit.html.erb" do
  before(:each) do
    @shop = assign(:shop, stub_model(Shop,
      :name => "MyString",
      :address => "MyString",
      :longitude => 1.5,
      :latitude => 1.5,
      :gmaps => false
    ))
  end

  it "renders the edit shop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shops_path(@shop), :method => "post" do
      assert_select "input#shop_name", :name => "shop[name]"
      assert_select "input#shop_address", :name => "shop[address]"
      assert_select "input#shop_longitude", :name => "shop[longitude]"
      assert_select "input#shop_latitude", :name => "shop[latitude]"
      assert_select "input#shop_gmaps", :name => "shop[gmaps]"
    end
  end
end
