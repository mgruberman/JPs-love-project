class AddActiveToAllTables < ActiveRecord::Migration
  def self.up
    add_column :reviews, :isActive, :boolean, :default => true
    add_column :badges, :isActive, :boolean, :default => true
    add_column :shops, :isActive, :boolean, :default => true
    add_column :users, :isActive, :boolean, :default => true
    add_column :relationType, :isActive, :boolean, :default => true
    add_column :sharings, :isActive, :boolean, :default => true
    add_column :shop_checkin, :isActive, :boolean, :default => true
    add_column :user_badges, :isActive, :boolean, :default => true
    add_column :user_relations, :isActive, :boolean, :default => true
  end

  def self.down
    remove_column :reviews, :isActive
    remove_column :badges, :isActive
    remove_column :shops, :isActive
    remove_column :users, :isActive
    remove_column :relationType, :isActive
    remove_column :sharings, :isActive
    remove_column :shop_checkin, :isActive
    remove_column :user_badges, :isActive
    remove_column :user_relations, :isActive
  
  end
end
