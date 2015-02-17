class SightingsController < ApplicationController

  before_action :authenticate_user!

  def create
    @sighting = Sighting.new(sighting_params)
    @sighting.user = current_user
    if @sighting.save
      flash[:notice] = "Sighting added to the map"
    else
      @sighting.delete
      flash[:alert] = "Your sighting has not been saved"
    end
    redirect_to '/'
  end
end

def sighting_params
  params.require(:sighting).permit(:caption, :image, :location, :seen_at)
end
