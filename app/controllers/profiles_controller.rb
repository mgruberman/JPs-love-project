class ProfilesController < ApplicationController
  def show
    @user = User.find_by_slug(params[:id])
    if @user.nil?
        #no users were returned, try by ID.
        @user = User.find(params[:id])
    end
    
    if @user.nil?
        #no users were found. break!
      redirect_to '/'
    end
    @reviews = Review.find(:all, :conditions => {:user_id => @user.id}, :include => :shop)
    @image_store = ImageStore.find(@user.photo_id)
    
  end
end