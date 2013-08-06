class DefaultsController < ApplicationController
  
  # GET /defaults
  # GET /defaults.json
  def index
    @defaults = Default.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @defaults }
    end
  end

  # GET /defaults/1
  # GET /defaults/1.json
  def show
    @default = Default.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @default }
    end
  end

  # GET /defaults/new
  # GET /defaults/new.json
  def new
    @default = Default.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @default }
    end
  end

  # GET /defaults/1/edit
  def edit
    @default = Default.find(params[:id])
  end

  # POST /defaults
  # POST /defaults.json
  def create
    @default = Default.new(params[:default])

    respond_to do |format|
      if @default.save
        format.html { redirect_to @default, 
          notice: 'Default was successfully created.' }
        format.json { render json: @default, 
          status: :created, location: @default }
      else
        format.html { render action: "new" }
        format.json { render json: @default.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  # PUT /defaults/1
  # PUT /defaults/1.json
  def update
    @default = Default.find(params[:id])

    respond_to do |format|
      if @default.update_attributes(params[:default])
        format.html { redirect_to @default, 
          notice: 'Default was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @default.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /defaults/1
  # DELETE /defaults/1.json
  def destroy
    @default = Default.find(params[:id])
    @default.destroy

    respond_to do |format|
      format.html { redirect_to defaults_url }
      format.json { head :no_content }
    end
  end


end
