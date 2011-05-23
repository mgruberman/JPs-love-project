class ShopCheckinsController < ApplicationController
  # GET /shop_checkins
  # GET /shop_checkins.xml
  def index
    @shop_checkins = ShopCheckin.find(:all, :include => :shop, :conditions => "user_id = #{current_user.id}")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shop_checkins }
    end
  end

  # GET /shop_checkins/1
  # GET /shop_checkins/1.xml
  def show
    @shop_checkin = ShopCheckin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shop_checkin }
    end
  end

  # GET /shop_checkins/new
  # GET /shop_checkins/new.xml
  def new
    @shop_checkin = ShopCheckin.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shop_checkin }
    end
  end

  # GET /shop_checkins/1/edit
  def edit
    @shop_checkin = ShopCheckin.find(params[:id])
  end

  # POST /shop_checkins
  # POST /shop_checkins.xml
  def create
    #TODO: add logic to make sure you can't check in more than x times / time??
    #params[:shop_id]
    #current_user.id

    @ShopCheckin = ShopCheckin.new(:shop_ID => "#{params[:shop_id]}", :user_ID => "#{current_user.id}")
    respond_to do |format|
      if @ShopCheckin.save
        @user = User.find(current_user.id)
        #Notifier.welcome_email(@user).deliver
        
        format.html { redirect_to("shops/#{params[:shop_id]}", :notice => 'You checked in here') }
        format.xml  { render :xml => @ShopCheckin, :status => :created, :location => "shops/#{params[:shop_id]}" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ShopCheckin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shop_checkins/1
  # PUT /shop_checkins/1.xml
  def update
    @shop_checkin = ShopCheckin.find(params[:id])

    respond_to do |format|
      if @shop_checkin.update_attributes(params[:shop_checkin])
        format.html { redirect_to(@shop_checkin, :notice => 'Shop checkin was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shop_checkin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_checkins/1
  # DELETE /shop_checkins/1.xml
  def destroy
    @shop_checkin = ShopCheckin.find(params[:id])
    @shop_checkin.destroy

    respond_to do |format|
      format.html { redirect_to(shop_checkins_url) }
      format.xml  { head :ok }
    end
  end
end
