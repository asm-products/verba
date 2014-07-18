Rails.application.routes.draw do
  root "pages#writing"

  get "/profile" => "pages#profile", as: :profile
  get "/archive" => "pages#archive", as: :archive

  get "login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  post "/logout" => "sessions#destroy", as: :logout
end
