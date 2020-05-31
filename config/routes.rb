Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'
  resources :books, except: [:new]
  resources :users, except: [:new]
  # resources :users, except: [:new]　do
  # 	resource :books, except: [:new]
  # end
end


# , controllers: { registrations: 'users/registrations',
#   									sessions: 'users/sessions' }


  # resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  #     resource :favorites, only: [:create, :destroy]
  #     resource :post_comments, only: [:create]
  # end

