Rails.application.routes.draw do
  root to: 'welcome#index'

  get "/profile", to: "profile#index"
end
