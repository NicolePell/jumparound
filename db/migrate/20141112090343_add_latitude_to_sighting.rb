class AddLatitudeToSighting < ActiveRecord::Migration
  def change
    add_column :sightings, :latitude, :float
  end
end
