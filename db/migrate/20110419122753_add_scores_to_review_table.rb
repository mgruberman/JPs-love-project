class AddScoresToReviewTable < ActiveRecord::Migration
  def self.up
  	add_column :reviews, :CappuccinoScore, :float
  	add_column :reviews, :EspressoScore, :float
  	add_column :reviews, :PersonalityScore, :float
  	add_column :reviews, :AtmosphereScore, :float
  	
  end
  def self.down
    remove_column :reviews, :CappuccinoScore
    remove_column :reviews, :EspressoScore
    remove_column :reviews, :PersonalityScore
    remove_column :reviews, :AtmosphereScore
  end
end
