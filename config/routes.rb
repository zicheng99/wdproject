Rails.application.routes.draw do
  

  namespace :admin do
    resources :promocodes
  end
  resources :categories
  resources :carts
  resources :line_items
  resources :products

  root 'products#index'

  get '/make_order', to: 'carts#make_order'
  get '/check_promo', to: 'line_items#check_promo'


  namespace :admin do
    get '/', to: 'carts#index'
    resources :admin_promocodes
    root to: 'products#index'
    resources :products
    resources :categories
    resources :carts
    resources :line_items
    get 'login', to: 'sessions#new', as: 'login'
    post 'sessions' => 'sessions#create'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    resources :shoppers
  end

  # custom login system
  get '/' => 'shoppers#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :shoppers
  get 'signup', to: 'shoppers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'

  post '/sessions' => 'sessions#create'
  post '/shoppers' => 'shoppers#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

end
