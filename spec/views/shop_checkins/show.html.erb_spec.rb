require 'spec_helper'

describe "shop_checkins/show.html.erb" do
  before(:each) do
    @shop_checkin = assign(:shop_checkin, stub_model(ShopCheckin))
  end

  it "renders attributes in <p>" do
    render
  end
end
