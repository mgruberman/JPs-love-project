module ReviewsHelper
	def activate_reviews_path(id)
		'/reviews/activate/' + id.to_s
	end
	
	def demolish_reviews_path(id)
		'/reviews/demolish/' + id.to_s
	end
end
