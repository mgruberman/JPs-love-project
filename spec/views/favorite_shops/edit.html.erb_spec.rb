require 'spec_helper'

describe "favorite_shops/edit.html.erb" do
  before(:each) do
    @favorite_shop = assign(:favorite_shop, stub_model(FavoriteShop,
      :shop_Id => 1,
      :user_id => 1,
      :isActive => false
    ))
  end

  it "renders the edit favorite_shop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => favorite_shops_path(@favorite_shop), :method => "post" do
      assert_select "input#favorite_shop_shop_Id", :name => "favorite_shop[shop_Id]"
      assert_select "input#favorite_shop_user_id", :name => "favorite_shop[user_id]"
      assert_select "input#favorite_shop_isActive", :name => "favorite_shop[isActive]"
    end
  end
end
