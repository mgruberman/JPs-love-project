class AddShopCheckinTable < ActiveRecord::Migration
  def self.up
    create_table :shop_checkin do |s|        
	s.column :shop_id, :integer
	s.column :user_id, :integer
	s.timestamps
    end
  end
  
  def self.down
    drop_table :shop_checkin
  end
end
