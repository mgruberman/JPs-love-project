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
        #relating user is the user who initiated the request, 
        #related is the targeted user.
    @user_relations = UserRelation.find(:all, :conditions => "RelatingUserID IN (#{current_user.id}) AND RelatedUserID IN (#{@user.id})")
  end
  
  def subscribe
    $notice = ''
    #you can instantly subscribe to a reviewer
    #make sure the target user is a reviewer.
    @user = User.find(params[:id])
    if !@user.nil?
        if @user.reviewer
            #good.
            #check to see they aren't already subscribed?
            @user_relations = UserRelation.find(:all, :conditions => "RelatingUserID IN (#{current_user.id}) AND RelatedUserID IN (#{params[:id]})")
            if @user_relations
                #good, no record exists.
                #insert it
                @user_relations = UserRelation.new(:RelatedUserID => "#{params[:id]}", :RelatingUserID => "#{current_user.id}", :isActive => 1)
                @user_relations.save
                $notice = 'you are now subscribed'
            elsif @user_relations.isActive = 0
                #record exists, but it's not active.
                #update it.
                @user_relations.update_attributes(:isActive => 1)
                $notice = 'you are now updated subscribed'
            else
                #this already exists, do nothing.
                $notice = 'you are still subscribed'
            end
        else
            #user is NOT a reviewer
            $notice = 'user is not a reviewer'
        end
    else
        #there is NO user record and 
        $notice = 'user does not exist'
    end
    respond_to do |format|
        format.html { redirect_to( profile_path(params[:id]), :notice => $notice) }
        format.xml  { render :xml => @shop, :status => :created, :location => profile_path(params[:id]) }
    end
  end
  
  def unsubscribe
    $notice = 'unsubscribed'
    #@user_relations = UserRelation.find(:all, :conditions => "RelatingUserID IN (#{current_user.id}) AND RelatedUserID IN (#{params[:id]})")
    @user_relations = UserRelation.destroy_all("RelatingUserID IN (#{current_user.id}) AND RelatedUserID IN (#{params[:id]})")
    respond_to do |format|
        format.html { redirect_to( profile_path(params[:id]), :notice => $notice) }
        format.xml  { render :xml => @shop, :status => :created, :location => profile_path(params[:id]) }
    end
  end
  
  def friend
    #to friend someone, they have to approve it.
    #TODO: this
  end
  
  def unfriend
    #TODO: this
  end
  
end