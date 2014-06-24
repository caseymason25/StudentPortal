class AddCourseTypeIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_type_id, :integer
  end
end
