class ChangeShopsDefaultIsActiveFlagToFalse < ActiveRecord::Migration
  def self.up
    change_column(:shops, :isActive, :boolean, :default => false)
  end

  def self.down
    change_column(:shops, :isActive, :boolean, :default => true)
  end
end
