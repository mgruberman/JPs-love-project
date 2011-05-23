class CreateFavoriteShops < ActiveRecord::Migration
  def self.up
    create_table :favorite_shops do |t|
      t.integer :shop_id
      t.integer :user_id
      t.boolean :isActive, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :favorite_shops
  end
end
