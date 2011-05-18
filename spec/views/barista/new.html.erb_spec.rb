require 'spec_helper'

describe "barista/new.html.erb" do
  before(:each) do
    assign(:baristum, stub_model(Baristum,
      :name => "MyString",
      :description => "MyString",
      :photo_id => 1
    ).as_new_record)
  end

  it "renders new baristum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => barista_path, :method => "post" do
      assert_select "input#baristum_name", :name => "baristum[name]"
      assert_select "input#baristum_description", :name => "baristum[description]"
      assert_select "input#baristum_photo_id", :name => "baristum[photo_id]"
    end
  end
end
