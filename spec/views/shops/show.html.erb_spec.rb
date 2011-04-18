require 'spec_helper'

describe "shops/show.html.erb" do
  before(:each) do
    @shop = assign(:shop, stub_model(Shop))
  end

  it "renders attributes in <p>" do
    render
  end
end
