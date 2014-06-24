class HomeController < ApplicationController
   def index

	@upcoming = Event.where(date: Time.now.midnight..(Time.now.midnight + 7.day))
  end
end
