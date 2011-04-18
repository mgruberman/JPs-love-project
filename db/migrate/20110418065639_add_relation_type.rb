class AddRelationType < ActiveRecord::Migration
  def self.up
    create_table :relationType do |r|        
	r.column :name, :string
	r.column :description, :string
    	  
	r.timestamps
    end
  end
  
  def self.down
    drop_table :relationType
  end
end
