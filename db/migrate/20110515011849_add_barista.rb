class AddBarista < ActiveRecord::Migration
  def self.up
    add_column :reviews, :barista_id, :integer
  end

  def self.down
    remove_column :reviews, :barista_id
  end
end
