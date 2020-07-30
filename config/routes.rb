Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/profile', to: 'profile#index'
  get '/personal', to: 'personal#show'


  resources :users, only: [:edit, :update]
  get '/auth/google/callback', to: 'sessions#create'
  get '/auth/failure', to:redirect('/')
  # get '/login', to: redirect("/auth/google_oauth2")
  get '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:create, :destroy]
  resources :birthday, only: [:new]
  resources :tasks
  # get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :daily, only: [:index]
end
