require '../spec_helper'

describe "Create event", :type => :feature do
  before  do 
	@event = Event.new
	User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
  end

  it "with fields entered correctly" do
	@event.title = "titleTest"
	@event.description = "descTest"
	@event.date = Date.today
	@event.location = "locTest"
	@event.host = "hostTest"
	@event.event_type_id = "1"

    expect(@event.title).to eq("titleTest")
	expect(@event.description).to eq("descTest")
	expect(@event.date).to eq(Date.today)
	expect(@event.location).to eq("locTest")
	expect(@event.host).to eq("hostTest")
	expect(@event.event_type_id).to eq(1)
    end
  
	it "with log in" do
	 visit "/login"
    fill_in "Email", :with => "test@example.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
	
	visit "/events/new"
	fill_in "Title", :with => "testTitle" 
	fill_in "Description", :with => "descTitle"
	fill_in "Date", :with => Date.today
	fill_in "Location", :with => "locTitle"
	fill_in "Host", :with => "hostTitle"
	
	click_button "Create"
	
	expect(page).to have_text("testTitle")
	expect(page).to have_text("descTitle")
	expect(page).to have_text("locTitle")
	expect(page).to have_text("hostTitle")
	expect(page).to have_text(Date.today)
	end
  

end
