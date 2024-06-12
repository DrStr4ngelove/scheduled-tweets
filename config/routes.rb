Rails.application.routes.draw do
  # GET /about
  get "about", to: "about#index"

  # root route
  get "/", to: "main#index"

end