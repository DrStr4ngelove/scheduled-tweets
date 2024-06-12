Rails.application.routes.draw do
  root "main#index"
  # GET /about
  get "about-me", to: "about#index", as: :about

  # root route
  get "/", to: "main#index"

end