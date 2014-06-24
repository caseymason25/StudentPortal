class Course < ActiveRecord::Base
belongs_to :course_type
searchable do
       text :title, :default_boost => 2
       text :department
	   text :number
	   text :description
  end

end
