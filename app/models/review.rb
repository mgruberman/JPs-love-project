class Review < ActiveRecord::Base
	validates_presence_of :shop_id, :description, :AtmosphereScore, :PersonalityScore, :DripScore, :user_id
	validates_numericality_of :user_id, :shop_id
	
	belongs_to :user
	belongs_to :shop
	belongs_to :baristum
	
end
