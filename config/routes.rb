Rails.application.routes.draw do
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
  post 'static_pages/sendquestion'

  get 'static_pages/help'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/publicprofile'

  post 'bids/search'
  post 'bids/createreturn'

  get 'static_pages/proposition'

match "/bids/reserver/:id" => "bids#reserver" , via: [:get], :as => :reserver
match "/bids/annulerresa/:id" => "bids#annulerresa" , via: [:get], :as => :annulerresa

  root 'static_pages#home'


   devise_for :users

  resources :users
end
