require 'spec_helper'

describe "user_locations/new.html.erb" do
  before(:each) do
    assign(:user_location, stub_model(UserLocation,
      :user_id => 1,
      :name => "MyString",
      :address => "MyString",
      :longitude => 1.5,
      :latitude => 1.5,
      :gmaps => false
    ).as_new_record)
  end

  it "renders new user_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_locations_path, :method => "post" do
      assert_select "input#user_location_user_id", :name => "user_location[user_id]"
      assert_select "input#user_location_name", :name => "user_location[name]"
      assert_select "input#user_location_address", :name => "user_location[address]"
      assert_select "input#user_location_longitude", :name => "user_location[longitude]"
      assert_select "input#user_location_latitude", :name => "user_location[latitude]"
      assert_select "input#user_location_gmaps", :name => "user_location[gmaps]"
    end
  end
end
