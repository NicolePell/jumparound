class Sighting < ActiveRecord::Base

  belongs_to :user
  has_many :likes

  has_attached_file :image, :styles => { :medium => "420x420>", :thumb => "100x100>", :grid => "250x250#" }, :default_url => "/images/:style/missing.png", :s3_protocol => :https
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  geocoded_by :location
  after_validation :geocode

end
