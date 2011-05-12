class CreateImageStores < ActiveRecord::Migration
  def self.up
    create_table :image_stores do |t|
        t.column :description, :string 
        t.column :content_type, :string 
        t.column :filename, :string 
        t.column :binary_data, :binary 
        t.timestamps
    end
  end

  def self.down
    drop_table :image_stores
  end
end
