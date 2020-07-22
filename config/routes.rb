Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :daily, only: [:index]
end
