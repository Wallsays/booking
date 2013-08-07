Booking::Application.routes.draw do
  
  root :to => "home#index"
  get "home/index"

  devise_for :users, :controllers => {
    :registrations => "registrations",
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }, :path => '', :path_names => { 
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
  resources :inventory_templates
  resources :inventories

end
