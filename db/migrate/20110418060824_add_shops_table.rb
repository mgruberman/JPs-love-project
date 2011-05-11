class AddShopsTable < ActiveRecord::Migration
  def self.up
    create_table :shops do |s|        
      s.column :name, :string
      s.column :address, :string
      s.column :city, :string
      s.column :state, :string
      s.column :zipcode, :string
      s.column :latitude, :integer
      s.column :longitude, :integer
      s.column :description, :string
      s.timestamps
    end
  end
  
  def self.down
    drop_table :shops
  end
end
