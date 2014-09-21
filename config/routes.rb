Rails.application.routes.draw do
  root "pages#writing"

  resources :users, only: [:new, :create] 
  get "/profile" => "profile#show"

  post "/update_post" => "posts#update"
  resources :posts, only: [:create, :update]

  get "/archive" => "pages#archive", as: :archive
  get "/download" => "pages#download", as: :download 

  get "login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  post "/logout" => "sessions#destroy", as: :logout
end
