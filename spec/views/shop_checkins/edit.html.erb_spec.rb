require 'spec_helper'

describe "shop_checkins/edit.html.erb" do
  before(:each) do
    @shop_checkin = assign(:shop_checkin, stub_model(ShopCheckin))
  end

  it "renders the edit shop_checkin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shop_checkins_path(@shop_checkin), :method => "post" do
    end
  end
end
