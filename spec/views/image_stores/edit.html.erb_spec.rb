require 'spec_helper'

describe "image_stores/edit.html.erb" do
  before(:each) do
    @image_store = assign(:image_store, stub_model(ImageStore))
  end

  it "renders the edit image_store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => image_stores_path(@image_store), :method => "post" do
    end
  end
end
