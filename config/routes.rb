Rails.application.routes.draw do
  root "pages#writing"

  get "/profile" => "pages#profile", as: :profile
  get "/archive" => "pages#archive", as: :archive
end
