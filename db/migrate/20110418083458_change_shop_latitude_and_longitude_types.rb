class ChangeShopLatitudeAndLongitudeTypes < ActiveRecord::Migration
  def self.up
  	change_column(:shops, :latitude, :float)
  	change_column(:shops, :longitude, :float)
  end

  def self.down
    	change_column(:shops, :latitude, :integer)
  	change_column(:shops, :longitude, :integer)
  end
end
