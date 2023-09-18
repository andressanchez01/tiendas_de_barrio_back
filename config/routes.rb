Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users , controllers: { registrations: 'users/registrations', sessions: 'users/sessions/sessions' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :products
  root 'welcome#index'
end
