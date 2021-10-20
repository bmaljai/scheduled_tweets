# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  
  # GET /about
  get "/about", to: "about#index", as: :firstLink
  # can use the '/' or not, this is same as above 
  # get "about", to: "about#index"
  
  get "/", to: "main#index", as: :secondLink
  root to: "main#index"
  # can use the '/' or not, this is same as above 
  # get "", to: "main#index"
  # also for root, you can use special root keyword
  # root to: "main#index"

end
