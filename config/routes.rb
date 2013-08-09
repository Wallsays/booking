AuthApp::Application.routes.draw do

  root :to => "home#index"  
  # get "home/index"

  resources :inventories
  resources :inventory_templates
  resources :reservations
  resources :restaurants
   
  devise_for :owners
  devise_for :users, controllers: { 
    omniauth_callbacks: "omniauth_callbacks" 
  }
   
end
