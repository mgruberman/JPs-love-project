require 'spec_helper'

describe "reviews/show.html.erb" do
  before(:each) do
    @review = assign(:review, stub_model(Review))
  end

  it "renders attributes in <p>" do
    render
  end
end
