class Photo < ActiveRecord::Base
	belongs_to :user
	belongs_to :shop
	belongs_to :baristum
	belongs_to :review
	
  #paperclip
  has_attached_file :photo,
	   :styles => {
	   :thumb=> "100x100#",
	   :small  => "400x400>",
	   :original => "800x800" },
	 :storage => :s3,
	 :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
	 :path => "/:style/:id/:filename"
	 
end
