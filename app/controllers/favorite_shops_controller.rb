class FavoriteShopsController < ApplicationController
  # GET /favorite_shops
  # GET /favorite_shops.xml
  def index
    @favorite_shops = FavoriteShop.find(:all, :include => :shop, :conditions => "user_id = #{current_user.id} AND isActive = 1")
    @json = Shop.find(:all, :include => :favorite_shops, :conditions => "favorite_shops.user_id = #{current_user.id} AND favorite_shops.isActive = 1").to_gmaps4rails
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favorite_shops }
    end
  end

  # GET /favorite_shops/1
  # GET /favorite_shops/1.xml
  def show
    @favorite_shop = FavoriteShop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @favorite_shop }
    end
  end

  # GET /favorite_shops/new
  # GET /favorite_shops/new.xml
  def new
    @favorite_shop = FavoriteShop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @favorite_shop }
    end
  end

  # GET /favorite_shops/1/edit
  def edit
    @favorite_shop = FavoriteShop.find(params[:id])
  end
  
  def activateIndex
    #TODO: how do I call activate here?
    #shop_id is being passed in
    @favorite_shop = FavoriteShop.new(:shop_id => "#{params[:id]}", :user_id => "#{current_user.id}")

    if @favorite_shop.save
      #TODO: add some error messages
      $favoriteNotice = 'favorited!'
    else
      #TODO: add some error messages
      $favoriteNotice = 'NOT favorited!'
    end

    respond_to do |format|
      format.html { redirect_to("/shops/") }
      format.xml  { head :ok }
    end
  end
  
  def deactivateFavoriteIndex
    FavoriteShop.destroy_all( :shop_id => "#{params[:id]}" , :user_id => "#{current_user.id}" )

    respond_to do |format|
      format.html { redirect_to("/favorite_shops/") }
      format.xml  { head :ok }
    end
  end
  
  def deactivateIndex
    #TODO: how do I call deactivate here?
    #shop_id is being passed in
    #@favorite_shop = FavoriteShop.find(:all, :conditions => {:shop_Id => "#{params[:id]}", :user_id => "#{current_user.id}"})
    FavoriteShop.destroy_all( :shop_id => "#{params[:id]}" , :user_id => "#{current_user.id}" )

    respond_to do |format|
      format.html { redirect_to("/shops/") }
      format.xml  { head :ok }
    end
  end
  
  def activate
    #shop_id is being passed in
    @favorite_shop = FavoriteShop.new(:shop_id => "#{params[:id]}", :user_id => "#{current_user.id}")
    
    if @favorite_shop.save
      #TODO: add some error messages
    else
      #TODO: add some error messages
    end
    
    respond_to do |format|
      format.html { redirect_to("/shops/#{params[:id]}") }
      format.xml  { head :ok }
    end
  end
  
  def deactivate
    #shop_id is being passed in
    #@favorite_shop = FavoriteShop.find(:all, :conditions => {:shop_Id => "#{params[:id]}", :user_id => "#{current_user.id}"})
    FavoriteShop.destroy_all( :shop_id => "#{params[:id]}" , :user_id => "#{current_user.id}" )
    
    respond_to do |format|
      format.html { redirect_to("/shops/#{params[:id]}") }
      format.xml  { head :ok }
    end
  end

  # POST /favorite_shops
  # POST /favorite_shops.xml
  def create
    @favorite_shop = FavoriteShop.new(params[:favorite_shop])

    respond_to do |format|
      if @favorite_shop.save
        format.html { redirect_to(@favorite_shop, :notice => 'Favorite shop was successfully created.') }
        format.xml  { render :xml => @favorite_shop, :status => :created, :location => @favorite_shop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @favorite_shop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /favorite_shops/1
  # PUT /favorite_shops/1.xml
  def update
    @favorite_shop = FavoriteShop.find(params[:id])

    respond_to do |format|
      if @favorite_shop.update_attributes(params[:favorite_shop])
        format.html { redirect_to(@favorite_shop, :notice => 'Favorite shop was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @favorite_shop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_shops/1
  # DELETE /favorite_shops/1.xml
  def destroy
    @favorite_shop = FavoriteShop.find(params[:id])
    @favorite_shop.destroy

    respond_to do |format|
      format.html { redirect_to(favorite_shops_url) }
      format.xml  { head :ok }
    end
  end
end
