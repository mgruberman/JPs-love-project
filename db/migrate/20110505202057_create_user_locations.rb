class CreateUserLocations < ActiveRecord::Migration
  def self.up
    create_table :user_locations do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
    end
  end

  def self.down
    drop_table :user_locations
  end
end
