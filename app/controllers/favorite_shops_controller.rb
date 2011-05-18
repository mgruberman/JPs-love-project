class FavoriteShopsController < ApplicationController
  # GET /favorite_shops
  # GET /favorite_shops.xml
  def index
    @favorite_shops = FavoriteShop.all

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
