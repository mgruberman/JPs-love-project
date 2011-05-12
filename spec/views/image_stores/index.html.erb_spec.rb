require 'spec_helper'

describe "image_stores/index.html.erb" do
  before(:each) do
    assign(:image_stores, [
      stub_model(ImageStore),
      stub_model(ImageStore)
    ])
  end

  it "renders a list of image_stores" do
    render
  end
end
