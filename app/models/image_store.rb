class ImageStore < ActiveRecord::Base
=begin
  def image_file=(input_data) 
    self.filename = input_data.original_filename 
    self.content_type = input_data.content_type.chomp 
    self.binary_data = input_data.read 
  end 
=end

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
