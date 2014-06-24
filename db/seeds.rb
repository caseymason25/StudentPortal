# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Event.delete_all
Course.delete_all
CourseType.delete_all



# create 10 users
10.times do |i|
  user = User.create([{email: "User##{i}@test.com", password: "testuser#{i}"}]).first
  event = Event.create([{title: "Event ##{i}", description: "Here is the description for event ##{i}", date: DateTime.now + (2*i).day, location: "Here or there", approved: "1", host: "Some host", event_type_id: (i%3)+1}]).first
  event.user = user
  event.save!
end

EventType.find_or_create_by_title("Club Meeting")
EventType.find_or_create_by_title("Lecture Series")
EventType.find_or_create_by_title("Company Visit")

10.times do |i|
  course = Course.create([{title: "Course ##{i}", description: "Here is the description for event ##{i}", department: "CIS", number: "10#{i}", hours: "#{i}",  course_type_id: (i%3)+1}]).first
  course.save!
end

CourseType.create(title: "Computer Science" , id: 1)
CourseType.create(title: "Information Science" , id: 2)
CourseType.create(title: "Software Engineering" , id: 3)

#CourseType.find_or_create_by_title("Computer Science")
#CourseType.find_or_create_by_title("Information Science")
#CourseType.find_or_create_by_title("Software Engineering")*/