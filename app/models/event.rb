class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :event_type
	
	 searchable do
       text :title, :default_boost => 2
	   text :description
	   text :event_type
	   text :location
  end

end
