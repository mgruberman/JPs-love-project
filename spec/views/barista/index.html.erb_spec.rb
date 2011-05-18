require 'spec_helper'

describe "barista/index.html.erb" do
  before(:each) do
    assign(:barista, [
      stub_model(Baristum,
        :name => "Name",
        :description => "Description",
        :photo_id => 1
      ),
      stub_model(Baristum,
        :name => "Name",
        :description => "Description",
        :photo_id => 1
      )
    ])
  end

  it "renders a list of barista" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
