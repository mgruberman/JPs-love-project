class BaristaController < ApplicationController
  # GET /barista
  # GET /barista.xml
  def index
    @barista = Baristum.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @barista }
    end
  end

  # GET /barista/1
  # GET /barista/1.xml
  def show
    @baristum = Baristum.find(params[:id])
    @reviews = Review.find(:all, :conditions => {:barista_id => @baristum.id}, :include => :shop)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @baristum }
    end
  end

  # GET /barista/new
  # GET /barista/new.xml
  def new
    @baristum = Baristum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @baristum }
    end
  end

  # GET /barista/1/edit
  def edit
    @baristum = Baristum.find(params[:id])
  end

  # POST /barista
  # POST /barista.xml
  def create
    @baristum = Baristum.new(params[:baristum])

    respond_to do |format|
      if @baristum.save
        format.html { redirect_to(@baristum, :notice => 'Baristum was successfully created.') }
        format.xml  { render :xml => @baristum, :status => :created, :location => @baristum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @baristum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /barista/1
  # PUT /barista/1.xml
  def update
    @baristum = Baristum.find(params[:id])

    respond_to do |format|
      if @baristum.update_attributes(params[:baristum])
        format.html { redirect_to(@baristum, :notice => 'Baristum was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @baristum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /barista/1
  # DELETE /barista/1.xml
  def destroy
    @baristum = Baristum.find(params[:id])
    @baristum.destroy

    respond_to do |format|
      format.html { redirect_to(barista_url) }
      format.xml  { head :ok }
    end
  end
end
