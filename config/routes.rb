Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root 'home#top'
  get 'home/about'
  get '/map_request', to: 'users#map', as: 'map_request'
  resources :books, except: [:new] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  resources :users, except: [:new] do
    member do
      get :following, :followers
    end
    get :search, on: :collection
  end
  resources :relationships, only: [:create, :destroy]
  
end

