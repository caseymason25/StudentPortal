require 'spec_helper'

describe "Creating events", :type => :feature do
  before :each do
    @user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
    sign_in @user
  end

  it "displays the user's username after successful login" do
    visit "/events"
    click_button "New Event"

    fill_in "Title", :with => "New Year"
    fill_in "Description", :with => "Description"
    fill_in "Date", :with => "1/1/2015"
    fill_in "Location", :with => "The Ville"
    fill_in "Host", :with => "Bars"

    click_button "Create"

    expect(page).to have_content("New Year")
 
  end

end