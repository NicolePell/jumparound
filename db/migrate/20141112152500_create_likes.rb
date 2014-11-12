class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :sighting, index: true

      t.timestamps null: false
    end
  end
end
