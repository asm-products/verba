require 'sidekiq/web'

Rails.application.routes.draw do
	 root "today#show"
   mount Sidekiq::Web => '/sidekiq' if Rails.env.development?

	 resources :users, only: [:new, :create]
	 get "/profile" => "profile#show"

	 resources :posts, only: [:create, :update]

	 resources :archive, only: [:index]
	 get "/download" => "archive#download", as: :download 

	 get "/login" => "sessions#new", as: :login
	 post "/login" => "sessions#create"
	 post "/logout" => "sessions#destroy", as: :logout
end
