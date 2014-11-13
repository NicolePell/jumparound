class ChangeDateFormatInSightings < ActiveRecord::Migration
  def up
    change_column :sightings, :seen_at, :date
  end

  def down
    change_column :sightings, :seen_at, :datetime
  end
end
