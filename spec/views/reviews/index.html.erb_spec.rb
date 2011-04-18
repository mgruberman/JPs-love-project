require 'spec_helper'

describe "reviews/index.html.erb" do
  before(:each) do
    assign(:reviews, [
      stub_model(Review,
        :shop_id => 1,
        :description => "Description",
        :score => ""
      ),
      stub_model(Review,
        :shop_id => 1,
        :description => "Description",
        :score => ""
      )
    ])
  end

  it "renders a list of reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
