class Review < ActiveRecord::Base
	validates_presence_of :shop_id, :description, :AtmosphereScore, :PersonalityScore
end
