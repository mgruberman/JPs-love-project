class MoveUserLocationsDefaultLocation < ActiveRecord::Migration
  def self.up
    add_column :user_locations, :isDefaultLocation, :boolean, :default => true
    remove_column :user_relations, :isDefaultLocation
  end

  def self.down
    add_column :user_relations, :isDefaultLocation, :boolean, :default => true
    remove_column :user_locations, :isDefaultLocation
  end
end
