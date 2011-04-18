class AddGmailFlagToShops < ActiveRecord::Migration
  def self.up
    add_column :shops, :gmaps, :boolean
  end

  def self.down
    remove_column :shops, :gmaps

  end
end
