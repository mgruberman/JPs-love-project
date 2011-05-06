class AddUserLocationsDefaultLocation < ActiveRecord::Migration
  def self.up
    add_column :user_relations, :isDefault, :boolean, :default => true
  end

  def self.down
    remove_column :user_relations, :isDefault
  end
end
