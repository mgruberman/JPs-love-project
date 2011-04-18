class AddReviewerToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :reviewer, :boolean, :default => false
  end

  def self.down
    remove_column :users, :reviewer
  end
end
