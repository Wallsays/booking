class ReservationsController < ApplicationController
  before_filter :authenticate_user!, 
                except: [:index, :show]
  before_filter :check_who_editing,  
                except: [:index, :show, :new, :create]
  # before_filter :process_reservation,  
  #               only: [:create, :update, :delete]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservations }
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/new
  # GET /reservations/new.json
  def new
    @reservation = Reservation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(params[:reservation])
    @reservation.user_id = current_user.id

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render json: @reservation, status: :created, location: @reservation }
      else
        format.html { render action: "new" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])
    @reservation.user_id = current_user.id

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end

  private 

    def check_who_editing
      @reservation = Reservation.find(params[:id])
      unless @reservation.user == current_user
        respond_to do |format|
          format.html { 
            redirect_to @reservation, 
            alert: "It's not yours reservation!" }
          format.json { head :no_content, 
            status: :unprocessable_entity  }
        end
      end
    end

    def process_reservation
      # @reservation = Reservation.find(params[:id])
      # @reservation.user_id = current_user.id

      # date1 = @reservation.date
      # start_time = @reservation.start_time
      # end_time = @reservation.end_time 
      # party_size = @reservation.party_size 
       
      # # check for existing dates in inventories
      # @inventories = Inventory.where(:date => date1 )
   
      # @inventory_templates = InventoryTemplate.where(
      #   :start_time >= start_time and 
      #   :end_time <= end_time and 
      #   :quantity_available >= party_size)

      # InventoryTemplate.where("start_time <= ? and end_time >= ?", Reservation.first.start_time, Reservation.first.end_time)

 
    end

end
