module UserLocationsHelper
	def set_default_user_location_path(id)
		'/user_locations/set_default/' + id.to_s
	end
end
