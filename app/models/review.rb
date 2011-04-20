class Review < ActiveRecord::Base
	validates_presence_of :shop_id, :description, :AtmosphereScore, :PersonalityScore
	belongs_to :user
	belongs_to :shop
end
