require 'spec_helper'

describe "reviews/edit.html.erb" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :shop_id => 1,
      :description => "MyString",
      :score => ""
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviews_path(@review), :method => "post" do
      assert_select "input#review_shop_id", :name => "review[shop_id]"
      assert_select "input#review_description", :name => "review[description]"
      assert_select "input#review_score", :name => "review[score]"
    end
  end
end
