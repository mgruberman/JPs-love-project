require 'spec_helper'

describe "user_locations/index.html.erb" do
  before(:each) do
    assign(:user_locations, [
      stub_model(UserLocation,
        :user_id => 1,
        :name => "Name",
        :address => "Address",
        :longitude => 1.5,
        :latitude => 1.5,
        :gmaps => false
      ),
      stub_model(UserLocation,
        :user_id => 1,
        :name => "Name",
        :address => "Address",
        :longitude => 1.5,
        :latitude => 1.5,
        :gmaps => false
      )
    ])
  end

  it "renders a list of user_locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
