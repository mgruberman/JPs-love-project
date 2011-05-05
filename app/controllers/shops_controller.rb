class ShopsController < ApplicationController
  # GET /shops
  # GET /shops.xml
  def index
    	@shops = Shop.find(:all, :include => [:reviews])
    	@json = Shop.all.to_gmaps4rails
      
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shops }
    end
  end

  # GET /shops/1
  # GET /shops/1.xml
  def show
    @shop = Shop.find(params[:id])
    shop_id = params[:id]
    @reviews = Review.find(:all, :conditions => {:shop_id => @shop.id})
    
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
