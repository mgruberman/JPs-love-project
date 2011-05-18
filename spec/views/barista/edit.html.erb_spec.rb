require 'spec_helper'

describe "barista/edit.html.erb" do
  before(:each) do
    @baristum = assign(:baristum, stub_model(Baristum,
      :name => "MyString",
      :description => "MyString",
      :photo_id => 1
    ))
  end

  it "renders the edit baristum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => barista_path(@baristum), :method => "post" do
      assert_select "input#baristum_name", :name => "baristum[name]"
      assert_select "input#baristum_description", :name => "baristum[description]"
      assert_select "input#baristum_photo_id", :name => "baristum[photo_id]"
    end
  end
end
