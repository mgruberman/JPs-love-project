class AddUserRelationsTable < ActiveRecord::Migration
  def self.up
    create_table :user_relations do |u|        
	u.column :RelatingUserID, :string
	u.column :RelatedUserID, :integer
	u.column :RelationTypeID, :integer
	u.column :RelationAcknowledge, :datetime
    	  
	u.timestamps
    end
  end
  
  def self.down
    drop_table :user_relations
  end
end
