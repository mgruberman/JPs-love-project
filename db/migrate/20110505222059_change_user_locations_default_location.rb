class ChangeUserLocationsDefaultLocation < ActiveRecord::Migration
  def self.up
    rename_column(:user_relations, :isDefault, :isDefaultLocation)
  end

  def self.down
    rename_column(:user_relations, :isDefaultLocation, :isDefault )
  end
end
