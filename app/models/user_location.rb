class UserLocation < ActiveRecord::Base
	belongs_to :user
	
	acts_as_gmappable
	def gmaps4rails_address
		self.address 
	end
	
	validates_presence_of :user_id
	validates_numericality_of :user_id

end
