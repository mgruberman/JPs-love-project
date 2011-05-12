require 'spec_helper'

describe "image_stores/new.html.erb" do
  before(:each) do
    assign(:image_store, stub_model(ImageStore).as_new_record)
  end

  it "renders new image_store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => image_stores_path, :method => "post" do
    end
  end
end
