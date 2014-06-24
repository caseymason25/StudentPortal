class EventsController < ApplicationController
  before_filter :authenticate_user!,
    :only => [:new, :create]

  def index
  	@events = Event.all

    if user_signed_in?
      if !current_user.admin
        @events = Event.where(approved: true)
      end
    else 
      @events = Event.where(approved: true)
    end
    @types = EventType.all
	@upcoming = Event.where(date: Time.now.midnight..(Time.now.midnight + 7.day))
  end

  def new

  	@event = Event.new
  	@types = EventType.all
  end

  def create
  	@event = Event.new(event_params)
  	@event.user = current_user
  	@event.approved = false
  	@event.save!
  	redirect_to events_path
  end
  

    # GET /events/1
	# GET /courses/1.json
  def show
	@event = Event.find(params[:id])
  end
  
    # GET /events/1/
  def edit
  @types = EventType.all
	@event = Event.find(params[:id])
  end
  
    # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
	@event = Event.find(params[:id])
 
	if @event.update(event_params)
		redirect_to @event
	else
		render 'edit'
	end
  end

  
  def destroy
	@event = Event.find(params[:id])
	@event.destroy
	
	redirect_to events_path
  end
  
  private
  	def event_params
  		params.require(:event).permit(:title, :description, :date, :location, :host, :event_type_id, :approved)
  	end
end
