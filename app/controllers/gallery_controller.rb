class GalleryController < ApplicationController

  def index
    @sightings = Sighting.all
  end
  
end
