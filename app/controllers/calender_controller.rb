class CalenderController < ApplicationController
  def show
    @events = Event.find(:all, :order => 'date, id', :limit => 50)
    @events_group_by_date = @events.group_by { |t| t.date }
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
