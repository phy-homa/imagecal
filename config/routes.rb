Rails.application.routes.draw do
  devise_for :users, controllers:{
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "images#index"
  resources :images, only: [:index, :new, :create, :show]
  resources :users, only: [:new, :show]
  post '/setting' => 'users#setting'
  resources :carts, only:[:show, :destroy]
  post '/add_item' => 'carts#add_item'
end
