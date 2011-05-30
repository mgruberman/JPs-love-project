class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :file_name
      t.string :content_type
      t.integer :file_size
      t.integer :user_id
      t.integer :barista_id
      t.integer :review_id
      t.integer :shop_id

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
