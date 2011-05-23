require 'spec_helper'

describe "shop_checkins/index.html.erb" do
  before(:each) do
    assign(:shop_checkins, [
      stub_model(ShopCheckin),
      stub_model(ShopCheckin)
    ])
  end

  it "renders a list of shop_checkins" do
    render
  end
end
