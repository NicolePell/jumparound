class HomeController < ApplicationController

def index
		@sightings = Sighting.all
end

end


def find_likes(sighting)
  @likes = Like.all
  @likes_history = []
  @likes.each {|like| @likes_history << like.user_id if like.sighting_id==sighting.id }
  @likes_history
end

def most_likes(sighting)
	@likes = Like.all
	@sightings = Sighting.all
	@most_likes = @sightings.each {|sighting| sighting.likes.count}.max_by{|sighting| sighting.likes.count }
	@most_likes
end
