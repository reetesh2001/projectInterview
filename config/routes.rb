Rails.application.routes.draw do

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete 'logout', to: 'sessions#destroy'
  root 'hrs#new'
  resources :hrs
end
