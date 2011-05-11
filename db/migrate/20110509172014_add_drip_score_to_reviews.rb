class AddDripScoreToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :DripScore, :float
  end

  def self.down
    remove_column :reviews, :DripScore
  end
end
