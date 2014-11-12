class HomeController < ApplicationController

def index
		@sightings = Sighting.all
	end

end
