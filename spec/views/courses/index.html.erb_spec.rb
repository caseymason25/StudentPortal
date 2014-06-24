require 'spec_helper'

describe "courses/index" do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :title => "Title",
        :description => "MyText",
        :department => "Department",
        :number => 1,
        :hours => 2,
        :degree_id => 3
      ),
      stub_model(Course,
        :title => "Title",
        :description => "MyText",
        :department => "Department",
        :number => 1,
        :hours => 2,
        :degree_id => 3
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Department".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
