require 'spec_helper'

describe "maps/new" do
  before(:each) do
    assign(:map, stub_model(Map,
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "MyString",
      :description => "MyText",
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new map form" do
    render

    assert_select "form[action=?][method=?]", maps_path, "post" do
      assert_select "input#map_latitude[name=?]", "map[latitude]"
      assert_select "input#map_longitude[name=?]", "map[longitude]"
      assert_select "input#map_address[name=?]", "map[address]"
      assert_select "textarea#map_description[name=?]", "map[description]"
      assert_select "input#map_title[name=?]", "map[title]"
    end
  end
end
