require 'spec_helper'

describe "favorite_shops/show.html.erb" do
  before(:each) do
    @favorite_shop = assign(:favorite_shop, stub_model(FavoriteShop,
      :shop_Id => 1,
      :user_id => 1,
      :isActive => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
