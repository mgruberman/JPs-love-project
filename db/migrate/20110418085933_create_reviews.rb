class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :shop_id
      t.string :description
      t.int :score

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
