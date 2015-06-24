Rails.application.routes.draw do
  root "landing_pages#index"

  get "/get_synonyms/:word" => "today#get_synonyms"
  get "/write" => "today#show", as: :write

  namespace :admin do
    resources :prompts
  end

  resources :users, path: "writers"
  get "/welcome" => "users#welcome"
  get "/profile" => "users#show"
  get "/writers/:id/stats" => "users#stats", as: :stats

  resources :posts, only: [:create, :update, :show]
  post "/publish/:post_id" => "posts#publish", as: :publish
  post "/unpublish/:post_id" => "posts#unpublish", as: :unpublish

  resources :comments, only: [:create]

  resources :archive, only: [:index]
  get "/download" => "archive#download", as: :download

  resources :landing_pages

  get "/login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  post "/logout" => "sessions#destroy", as: :logout

  resources :password_resets
  resources :subscriptions
end
