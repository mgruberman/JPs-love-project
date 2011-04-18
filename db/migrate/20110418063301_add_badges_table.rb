class AddBadgesTable < ActiveRecord::Migration
  def self.up
    create_table :badges do |b|        
      b.column :name, :string
      b.column :description, :string
      
      
      
      b.timestamps
    end
  end
  
  def self.down
    drop_table :badges
  end
end
