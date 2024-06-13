Rails.application.routes.draw do
  root "main#index"
  # GET /about
  get "about-me", to: "about#index", as: :about

  # root route
  get "/", to: "main#index"

  # sign up routes
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

end