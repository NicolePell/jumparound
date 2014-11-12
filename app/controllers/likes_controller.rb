class LikesController < ApplicationController

  def create
    @sighting = Sighting.find(params[:sighting_id])
    @like = @sighting.likes.new
    @like.user = current_user
    @like.save

    render json: {new_likes_count: @sighting.likes.count}
  end

end
