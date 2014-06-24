require 'spec_helper'

describe "the signin process", :type => :feature do
  before :each do
    User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
  end

  it "displays the user's username after successful login" do
    visit "/login"
    fill_in "Email", :with => "test@example.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"

    expect(page).to have_selector(".username", :text => "test@example.com")
  end

end