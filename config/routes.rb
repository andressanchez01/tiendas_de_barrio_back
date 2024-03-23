Rails.application.routes.draw do
  root 'welcome#index'
  get 'carts/show'
  get 'carts/update_quantity'
  get 'carts/remove_from_cart'
  get 'carts/checkout'
  get 'welcome/index'
  get '/products/shop', to: 'products#shop', as: 'products_shop'
  devise_for :users , controllers: { registrations: 'users/registrations', sessions: 'users/sessions/sessions' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :cart_items
  resource :cart, only: [:show]
  post 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
  delete 'remove_from_cart/:cart_item_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
  resources :products do
    post 'add_to_cart', on: :member
    get 'show_user', on: :member
  end
  resources :carts do
    member do
      post 'add_to_cart'
      patch 'update_cart_item'
      delete 'remove_from_cart'
    end
  end
  resources :orders do
    member do
      patch 'update_status'
    end
  end
  get '/all_orders', to: 'orders#all_orders', as: 'all_orders'

  resources :users
  get '/admin_panel', to: 'admin#panel', as: 'admin_panel'
end
