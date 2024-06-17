Rails.application.routes.draw do
  # root
  root "main#index"
  get "/", to: "main#index"

  # GET /about
  get "about_me", to: "about#index", as: :about

  # sign in
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  # sign up
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  # passwords
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  # password reset
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  # log out
  delete "logout", to: "sessions#destroy"
end
