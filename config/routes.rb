Rails.application.routes.draw do
  # root
  root "main#index"
  get "/", to: "main#index"

  # GET /about
  get "about-me", to: "about#index", as: :about

  # sign up
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
end
