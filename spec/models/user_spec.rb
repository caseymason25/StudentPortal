require 'spec_helper'

describe User do
  it "should have a valid email" do
  	user = User.new(email: "test@", password: "testpass")
  	expect(user).not_to be_valid
  end

  it "should have a valid password" do 
  	user = User.new(email: "test@example.com", password: "")
  	expect(user).not_to be_valid
  end
end
