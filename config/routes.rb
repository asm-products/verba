Rails.application.routes.draw do
  root "pages#writing"

  get "/users/new" => "users#new"
  post "users" => "users#create"

  get "/profile" => "pages#profile", as: :profile
  get "/archive" => "pages#archive", as: :archive
  get "/download" => "pages#download", as: :download

  post "/create_post" => "posts#create", as: :create_post
  post  "/update_post" => "posts#update", as: :update_post

  get "/new_prompt" => "pages#new_prompt"

  get "login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  post "/logout" => "sessions#destroy", as: :logout
end
