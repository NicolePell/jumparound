class AddUserIdToSighting < ActiveRecord::Migration
  def change
    add_reference :sightings, :user, index: true
  end
end
