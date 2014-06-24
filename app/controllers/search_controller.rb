class SearchController < ApplicationController
#GET /search/search
#GET /search/search.xml
def search
	@search = Event.search do
			keywords(params[:q])
		end
	@events = @search.results

	@search = Course.search do
			keywords(params[:q])
		end
	@courses = @search.results
	end
	
	 respond_to do |format|
		format.html { render :action=>"search" }
		format.xml { render :xml => @search}
	end
end
