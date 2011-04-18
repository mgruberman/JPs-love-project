require 'spec_helper'

describe "reviews/show.html.erb" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :shop_id => 1,
      :description => "Description",
      :score => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
