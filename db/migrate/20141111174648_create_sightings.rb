class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.string :caption
      t.string :location
      t.datetime :seen_at

      t.timestamps null: false
    end
  end
end
