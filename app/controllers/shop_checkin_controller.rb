class ShopCheckinController < ApplicationController
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
end
