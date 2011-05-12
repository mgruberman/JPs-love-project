class AddPhotoIdfk < ActiveRecord::Migration
  def self.up
    add_column :users, :photo_id, :int
    add_column :reviews, :photo_id, :int
    add_column :shops, :photo_id, :int
  end

  def self.down
    remove_column :users, :photo_id
    remove_column :reviews, :photo_id
    remove_column :shops, :photo_id
  end
end
