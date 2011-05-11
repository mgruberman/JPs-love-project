class ShopsController < ApplicationController
  # GET /shops
  # GET /shops.xml
  def index
    	
    	@json = Shop.all.to_gmaps4rails
      if !current_user.nil?
        @shops = Shop.connection.select_all("
          SELECT 
            s.*,
            u.name AS locationName,
            u.address AS locationAddress,
            getDistance(u.latitude,u.longitude,s.latitude,s.longitude)  * 69.078  AS distanceToMyLocation,
            getShopReviewScore(s.id) AS shopScore
          FROM
            shops s,
            user_locations u
          WHERE 
            u.isDefaultLocation = 1 AND
            u.user_id = #{current_user.id}
          ORDER BY distanceToMyLocation
          ")
      else
        @shops = Shop.connection.select_all("
            SELECT 
            s.*,
            NULL AS locationName,
            NULL AS locationAddress,
            NULL  AS distanceToMyLocation,
            getShopReviewScore(s.id) AS shopScore
          FROM
            shops s
               ")
      end
      
      
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shops }
    end
  end

  # GET /shops/1
  # GET /shops/1.xml
  def show
    if !current_user.nil?
        @shop = Shop.connection.select_all("
          SELECT 
            s.*,
            u.name AS locationName,
            u.address AS locationAddress,
            getDistance(u.latitude,u.longitude,s.latitude,s.longitude)  * 69.078  AS distanceToMyLocation,
            getShopReviewScore(s.id) AS shopScore
          FROM
            shops s,
            user_locations u
          WHERE 
            u.isDefaultLocation = 1 AND
            u.user_id = #{current_user.id} AND
            s.id = #{params[:id]}
          ")
      else
        @shop = Shop.connection.select_all("
          SELECT 
            s.*,
            NULL AS locationName,
            NULL AS locationAddress,
            NULL  AS distanceToMyLocation,
            getShopReviewScore(s.id) AS shopScore
          FROM
            shops s
          WHERE 
            s.id = #{params[:id]}
          ")
      end
      
    #shop_id = params[:id]
    @reviews = Review.connection.select_all("
      SELECT 
        r.*,
        getReviewScore(r.id) as reviewScore
      FROM reviews r
      WHERE r.shop_ID = #{params[:id]}
    ")
    
    @json = Shop.find(params[:id]).to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shop }
    end
  end

  # GET /shops/new
  # GET /shops/new.xml
  def new
    @shop = Shop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shop }
    end
  end

  # GET /shops/1/edit
  def edit
    @shop = Shop.find(params[:id])
  end

  # POST /shops
  # POST /shops.xml
  def create
    @shop = Shop.new(params[:shop])
    #return render :text => "The Create action... is #{@shop.isActive}"
    respond_to do |format|
      if @shop.save
        format.html { redirect_to(@shop, :notice => 'Shop was successfully created.') }
        format.xml  { render :xml => @shop, :status => :created, :location => @shop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shops/1
  # PUT /shops/1.xml
  def update
    @shop = Shop.find(params[:id])

    respond_to do |format|
      if @shop.update_attributes(params[:shop])
        format.html { redirect_to(@shop, :notice => 'Shop was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.xml
  #TODO: lock these down.
  def destroy
    @shop = Shop.find(params[:id])
    @shop.update_attribute(:isActive, false)
    
    #return render :text => "The @shop.isActive is #{@shop.isActive}"
    #logger.debug "The ~~~~~~@shop~~~~~ is #{@shop}"
    
    respond_to do |format|
      format.html { redirect_to(shops_url) }
      format.xml  { head :ok }
    end
  end
  
  def activate
    @shop = Shop.find(params[:id])
    @shop.update_attribute(:isActive, true)

    respond_to do |format|
      format.html { redirect_to(shops_url) }
      format.xml  { head :ok }
    end
  end
  
  # demolish /shops/1
  # demolish /shops/1.xml
  def demolish
    @shop = Shop.find(params[:id])
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to(shops_url) }
      format.xml  { head :ok }
    end
  end
end
