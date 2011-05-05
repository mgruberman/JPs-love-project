module ShopsHelper
	def activate_shops_path(id)
		'/shops/activate/' + id.to_s
	end
end
