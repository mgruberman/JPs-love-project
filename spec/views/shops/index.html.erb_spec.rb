require 'spec_helper'

describe "shops/index.html.erb" do
  before(:each) do
    assign(:shops, [
      stub_model(Shop),
      stub_model(Shop)
    ])
  end

  it "renders a list of shops" do
    render
  end
end
