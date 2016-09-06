Rails.application.routes.draw do
  devise_for :users
  post 'trajetpumds/search', :to => 'trajetpumds#search'
  get 'trajetpumds/search', :to => 'trajetpumds#search'
  post 'trajetpumds/confirm'
  get 'trajetpumds/annulerresa'
  get 'trajetpumds/reserver', :to => 'trajetpumds#reserver', :as => "reserver_trajet"
  get 'transactions/cancelling', :to => 'transactions#cancelling', :as => "annul_trans"

  resources :users
resources :transactions, only: [:new, :create, :cancelling]
  resources :resapumds
  resources :trajetpumds, only: [:new, :create, :show]
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



  root 'static_pages#home', :to =>'static_pages#home'


end
