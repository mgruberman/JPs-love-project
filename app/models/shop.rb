class Shop < ActiveRecord::Base
acts_as_gmappable
has_many :reviews

	def gmaps4rails_address
		address 
	end

end
