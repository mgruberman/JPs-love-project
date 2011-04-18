class AddReviewsTable < ActiveRecord::Migration
  def self.up
    create_table :reviews do |r|        
      r.column :shop_id , :integer
      r.column :user_id, :integer
      r.column :description, :string
      r.column :score, :integer
      
      r.timestamps
    end
  end
  
  def self.down
    drop_table :reviews
  end
end