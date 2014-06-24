json.array!(@courses) do |course|
  json.extract! course, :id, :title, :description, :department, :number, :hours, :degree_id
  json.url course_url(course, format: :json)
end
