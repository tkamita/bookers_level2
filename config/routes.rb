Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :books, except: [:new]
  resources :users, except: [:new]
end


# , controllers: { registrations: 'users/registrations',
#   									sessions: 'users/sessions' }