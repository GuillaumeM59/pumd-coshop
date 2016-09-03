Rails.application.routes.draw do
  devise_for :users
  post 'trajetpumds/search', :to => 'trajetpumds#search'
  get 'trajetpumds/search', :to => 'trajetpumds#search'

  resources :users
  resources :transactions
  resources :resapumds
  resources :trajetpumds
  resources :validations
  resources :coins
  resources :carmodels
  resources :carbrands
  resources :messages
  resources :cities
  resources :feedbacks
  resources :bids
  resources :cars
  resources :shops
  resources :brands
  resources :charges

  get 'static_pages/home'
  post 'static_pages/home'
  get 'static_pages/cgv', :to => 'static_pages#cgv', :as => "cgv"
  get 'static_pages/tdb', :to => 'static_pages#tdb', :as => "tdb"
  post 'static_pages/sendquestion'

  get 'static_pages/help'

  get 'static_pages/about'

  get 'static_pages/contact'


  post 'trajetpumds/confirm'
  post 'trajetpumds/annulerresa'
  post 'trajetpumds/reserver', :to => 'trajetpumds#reserver', :as => "reserver_trajet"

  root 'static_pages#home', :to =>'static_pages#home'


end
