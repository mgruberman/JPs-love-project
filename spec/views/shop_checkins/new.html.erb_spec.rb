require 'spec_helper'

describe "shop_checkins/new.html.erb" do
  before(:each) do
    assign(:shop_checkin, stub_model(ShopCheckin).as_new_record)
  end

  it "renders new shop_checkin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shop_checkins_path, :method => "post" do
    end
  end
end
