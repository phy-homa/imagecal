Rails.application.routes.draw do
  devise_for :users, controllers:{
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: "images#index"
  resources :images, only: [:index, :new, :create, :show, :destroy] do
   collection do
     get 'search'
   end
  end
  resources :users, only: [:new, :show, :index]
  get '/ordering' => 'users#ordering'
  resources :carts, only:[:show, :destroy]
  post '/add_item' => 'carts#add_item'
  resources :line_items, only: :destroy
  resources :calendars, only: [:new, :create, :show] do
    member do 
      get'show_order'
    end
    resources :orders, only: [:new, :create]
  end
end
