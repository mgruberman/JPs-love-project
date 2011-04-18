class AddUserBadgesTable < ActiveRecord::Migration
  def self.up
    create_table :user_badges do |u|        
      u.column :user_id, :integer
      u.column :badge_id, :integer
      
      
      
      u.timestamps
    end
  end
  
  def self.down
    drop_table :user_badges
  end
end
