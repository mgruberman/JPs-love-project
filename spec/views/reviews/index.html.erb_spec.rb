require 'spec_helper'

describe "reviews/index.html.erb" do
  before(:each) do
    assign(:reviews, [
      stub_model(Review),
      stub_model(Review)
    ])
  end

  it "renders a list of reviews" do
    render
  end
end
