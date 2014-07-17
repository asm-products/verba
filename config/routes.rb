Rails.application.routes.draw do
  root "pages#writing"

  get "/profile" => "pages#profile", as: :profile
end
