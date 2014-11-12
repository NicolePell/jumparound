class Like < ActiveRecord::Base
  belongs_to :sighting
  belongs_to :user
end
