Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'
  resources :books, except: [:new] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  resources :users, except: [:new]
  resources :relationships, only: [:create, :destroy]
end


