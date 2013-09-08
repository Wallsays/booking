class HomeController < ApplicationController

  # root route
  def index
    if user_signed_in?
      @rewards = current_user.rewards
    end
  end

 # GET /search/:search_term
  #todo: refactor
  def search
    @search = Hash.new
    @search["cuisine"]  = "Any" unless params[:cuisine].present?
    @search["price"]    = "Any" unless params[:price].present?
    @search["location"] = "Any" unless params[:location].present?
    @search["cuisine"]  ||= params[:cuisine]
    @search["price"]    ||= params[:price]
    @search["location"] ||= params[:location]

    if @search["price"][0]!="Any" and 
          @search["cuisine"][0]!="Any" 
      # @restaurants = Restaurant.near(@search, 10).limit(10)
      @search_results = Restaurant.with_cuisine(@search["cuisine"]).with_price(@search["price"])
    elsif @search["cuisine"][0]=="Any" and 
            @search["price"][0]!="Any" 
      @search_results = Restaurant.with_price(@search["price"])
    elsif @search["cuisine"][0]!="Any" and 
            @search["price"][0]=="Any" 
      @search_results = Restaurant.with_cuisine(@search["cuisine"])
    else 
      @search_results = Restaurant.all
    end
  end

end   