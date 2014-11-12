class LikesController < ApplicationController

  def create
    @sighting = Sighting.find(params[:sighting_id])
    @sighting.likes.create

    render json: {new_likes_count: @sighting.likes.count}
  end

end
