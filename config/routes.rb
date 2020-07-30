Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/profile', to: 'profile#index'
  get '/personal', to: 'personal#show'


  resources :users, only: [:edit, :update]

  get '/auth/google/callback', to: 'sessions#create'
  get '/auth/failure', to:redirect('/')
  get '/logout', to: 'sessions#destroy'
  # get 'auth/failure', to: redirect('/')

  resources :sessions, only: [:create, :destroy]
  resources :birthday, only: [:new]
  resources :tasks
  resources :daily, only: [:index]
end
