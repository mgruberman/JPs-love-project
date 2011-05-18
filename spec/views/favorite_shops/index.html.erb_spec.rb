require 'spec_helper'

describe "favorite_shops/index.html.erb" do
  before(:each) do
    assign(:favorite_shops, [
      stub_model(FavoriteShop,
        :shop_Id => 1,
        :user_id => 1,
        :isActive => false
      ),
      stub_model(FavoriteShop,
        :shop_Id => 1,
        :user_id => 1,
        :isActive => false
      )
    ])
  end

  it "renders a list of favorite_shops" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
