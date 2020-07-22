Rails.application.routes.draw do
  resources :daily, only: [:index]
end
