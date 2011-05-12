require 'spec_helper'

describe "image_stores/show.html.erb" do
  before(:each) do
    @image_store = assign(:image_store, stub_model(ImageStore))
  end

  it "renders attributes in <p>" do
    render
  end
end
