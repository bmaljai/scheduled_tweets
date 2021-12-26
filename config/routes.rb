# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  
  # GET /about
  get "/about", to: "about#index", as: :firstLink
  # can use the '/' or not, this is same as above 
  # get "about", to: "about#index"
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get "/", to: "main#index", as: :secondLink
  root to: "main#index"
  # can use the '/' or not, this is same as above 
  # get "", to: "main#index"
  # also for root, you can use special root keyword
  # root to: "main#index"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
end
