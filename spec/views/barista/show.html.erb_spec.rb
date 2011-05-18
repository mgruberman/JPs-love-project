require 'spec_helper'

describe "barista/show.html.erb" do
  before(:each) do
    @baristum = assign(:baristum, stub_model(Baristum,
      :name => "Name",
      :description => "Description",
      :photo_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
