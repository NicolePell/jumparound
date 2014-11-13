class Item < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "420x420>", :thumb => "100x100>", :grid => "250x250#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
