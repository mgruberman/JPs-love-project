class FavoriteShop < ActiveRecord::Base
	validates_numericality_of :user_id, :shop_id
	
	belongs_to :user
	belongs_to :shop
end
