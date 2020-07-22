Rails.application.routes.draw do
  root to: 'welcome#index'

  get "/profile", to: "profile#index"
  get '/personal', to: 'personal#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :daily, only: [:index]
end
