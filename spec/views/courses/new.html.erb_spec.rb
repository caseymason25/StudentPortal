require 'spec_helper'

describe "courses/new" do
  before(:each) do
    assign(:course, stub_model(Course,
      :title => "MyString",
      :description => "MyText",
      :department => "MyString",
      :number => 1,
      :hours => 1,
      :degree_id => 1
    ).as_new_record)
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do
      assert_select "input#course_title[name=?]", "course[title]"
      assert_select "textarea#course_description[name=?]", "course[description]"
      assert_select "input#course_department[name=?]", "course[department]"
      assert_select "input#course_number[name=?]", "course[number]"
      assert_select "input#course_hours[name=?]", "course[hours]"
      assert_select "input#course_degree_id[name=?]", "course[degree_id]"
    end
  end
end
