class Shop < ActiveRecord::Base
	has_many :reviews

	acts_as_gmappable
	def gmaps4rails_address
		self.address 
	end

end
