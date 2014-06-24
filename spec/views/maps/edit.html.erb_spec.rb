require 'spec_helper'

describe "maps/edit" do
  before(:each) do
    @map = assign(:map, stub_model(Map,
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "MyString",
      :description => "MyText",
      :title => "MyString"
    ))
  end

  it "renders the edit map form" do
    render

    assert_select "form[action=?][method=?]", map_path(@map), "post" do
      assert_select "input#map_latitude[name=?]", "map[latitude]"
      assert_select "input#map_longitude[name=?]", "map[longitude]"
      assert_select "input#map_address[name=?]", "map[address]"
      assert_select "textarea#map_description[name=?]", "map[description]"
      assert_select "input#map_title[name=?]", "map[title]"
    end
  end
end
