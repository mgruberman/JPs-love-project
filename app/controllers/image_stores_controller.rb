class ImageStoresController < ApplicationController
  # GET /image_stores/1
  # GET /image_stores/1.xml
  def code_image 
    #TODO: this is the current user, but we can change this to call it from different places.

    @image_data = ImageStore.find(params[:id]) #TODO: does this break if there is no photo?
    @image = @image_data.binary_data 
    send_data(@image,:type => @image_data.content_type,:filename => @image_data.filename,:disposition => 'inline') 
  end
  
  def index
    @image_stores = ImageStore.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @image_stores }
    end
  end

  # GET /image_stores/1
  # GET /image_stores/1.xml
  def show
    @image_store = ImageStore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image_store }
    end
  end

  # GET /image_stores/new
  # GET /image_stores/new.xml
  def new
    @image_store = ImageStore.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image_store }
    end
  end

  # GET /image_stores/1/edit
  def edit
    @image_store = ImageStore.find(params[:id])
  end

  # POST /image_stores
  # POST /image_stores.xml
  def create
    
    #TODO: imageType should be pased in, we can use this in the future. for now, it's just user.
    #TODO: that will change the redirect action in the future too, but for now, rediret to show user.
    
    respond_to do |format|
      if @image_store = ImageStore.create(params[:image_store])
        @user = User.find(current_user.id)
        
        if @user.update_attributes(:photo_id => @image_store.id)
          format.html { redirect_to(@image_store, :notice => 'Image store was successfully created. AND SO WAS USER!') }
          format.xml  { render :xml => @image_store, :status => :created, :location => profile_path(current_user) }
        else
          format.html { render :action => "new" }
          format.html { redirect_to(@image_store, :notice => 'Image store was successfully created. BUT USER UPDATE FAILED') }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image_store.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /image_stores/1
  # PUT /image_stores/1.xml
  def update
    @image_store = ImageStore.find(params[:id])

    respond_to do |format|
      if @image_store.update_attributes(params[:image_store])
        format.html { redirect_to(@image_store, :notice => 'Image store was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image_store.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /image_stores/1
  # DELETE /image_stores/1.xml
  def destroy
    @image_store = ImageStore.find(params[:id])
    @image_store.destroy

    respond_to do |format|
      format.html { redirect_to(image_stores_url) }
      format.xml  { head :ok }
    end
  end
end
