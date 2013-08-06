Booking::Application.routes.draw do
  
  root :to => "home#index"
  get "home/index"

  devise_for :users, :controllers => {
    :registrations => "registrations"
    }

  devise_for :users, :path => '', :path_names => { 
      :sign_in  => "login", 
      :sign_out => "logout", 
      :sign_up  => "register" 
    }

  # devise_for :users do 
  #   resources :reservations
  # end

  resources :restaurants do 
    # resources :reservations
  end 
  
  resources :reservations
  resources :defaults
  resources :inventories

end
