class ProfilesController < ApplicationController
  def show
    @user = User.find_by_slug(params[:id])
    @reviews = Review.find(:all, :conditions => ["user_id = :user_id", :user_id => @user.id], :include => [:shop])

    if @user.nil?
      redirect_to '/'
    end    
  end
end
