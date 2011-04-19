require 'spec_helper'

describe "reviews/new.html.erb" do
  before(:each) do
    assign(:review, stub_model(Review,
      :shop_id => 1,
      :description => "MyString",
      :CappuccinoScore => 1.5,
      :EspressoScore => 1.5,
      :PersonalityScore => 1.5,
      :AtmosphereScore => 1.5,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviews_path, :method => "post" do
      assert_select "input#review_shop_id", :name => "review[shop_id]"
      assert_select "input#review_description", :name => "review[description]"
      assert_select "input#review_CappuccinoScore", :name => "review[CappuccinoScore]"
      assert_select "input#review_EspressoScore", :name => "review[EspressoScore]"
      assert_select "input#review_PersonalityScore", :name => "review[PersonalityScore]"
      assert_select "input#review_AtmosphereScore", :name => "review[AtmosphereScore]"
      assert_select "input#review_user_id", :name => "review[user_id]"
    end
  end
end
