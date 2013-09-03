class HomeController < ApplicationController

  # root route
  def index
    if user_signed_in?
      @rewards = current_user.rewards
    end
  end

 # GET /search/:search_term
  def search
    @search = Hash.new
    @search["cuisine"] = params[:cuisine]
    @search["price"] = params[:price]
    @search["location"] = params[:location]

    if params[:cuisine].present? and 
          params[:price].present? 

      # @restaurants = Restaurant.near(@search, 10).limit(10)
      @search_results = Restaurant.where(["cuisine LIKE ? AND price = ?", 
                            "#{params[:cuisine]}",
                            "#{params[:price]}"
                         ])
    elsif params[:cuisine].present? and 
            not params[:price].present? 
      @search_results = Restaurant.where(["cuisine LIKE ?", 
                            "#{params[:cuisine]}"])
    elsif not params[:cuisine].present? and 
             params[:price].present? 
      @search_results = Restaurant.where(["price = ?", 
                            "#{params[:price]}"])
    else 
      @search_results = Restaurant.all
    end
  end

end

# Reward.create(user_id: 1, reseravtion_id: 1, points_total: 5, points_pending: 5, description: "text")
   