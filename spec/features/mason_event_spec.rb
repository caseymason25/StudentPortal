require '../spec_helper'

describe "Create a new event", :type => :feature do
  before :each do
    User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
  end

  it "login and create a new event" do
    visit "/login"
    fill_in "Email", :with => "test@example.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
	
	visit "/events/new"
	fill_in "Title", :with => "Test title"
	fill_in "Description", :with => "Test description"
	#fill_in "Date", :with => "11/22/1988"
	fill_in "Location", :with => "Test Location"
	fill_in "Host", :with => "Test host"
	click_button "Create"
	
	expect(page).to have_selector("td", :text => "Test description")

    
  end

end