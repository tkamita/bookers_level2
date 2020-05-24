Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :books, except: [:new]
  resources :users, except: [:new]
end


# , controllers: { registrations: 'users/registrations',
#   									sessions: 'users/sessions' }


  # resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  #     resource :favorites, only: [:create, :destroy]
  #     resource :post_comments, only: [:create]
  # end