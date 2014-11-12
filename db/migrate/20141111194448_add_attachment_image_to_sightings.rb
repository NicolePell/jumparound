class AddAttachmentImageToSightings < ActiveRecord::Migration
  def self.up
    change_table :sightings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sightings, :image
  end
end
