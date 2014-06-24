require 'spec_helper'

describe "the registration process", :type => :feature do
  it "registers a new user" do
    visit "/sign_up"
    fill_in "Email", :with => "test@example.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"

    expect(page).to have_selector(".username", :text => "test@example.com")
  end

end