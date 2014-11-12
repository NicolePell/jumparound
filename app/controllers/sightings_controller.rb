class SightingsController < ApplicationController

	def new
	end

	def create
		Sighting.create(sighting_params)
		redirect_to '/'
	end

end

def sighting_params
	params.require(:sighting).permit(:caption, :image, :location)
end
