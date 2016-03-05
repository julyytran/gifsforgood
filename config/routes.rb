Rails.application.routes.draw do

  root to: "gifs#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
  get "/dashboard", to: "users#show"

  resources :cart_gifs, only: [:create]
  get "/cart", to: "cart_gifs#show"
  delete "/cart", to: "cart_gifs#destroy"
  patch "/cart", to: "cart_gifs#update"

  resources :orders, only: [:index, :show, :create]
  get "/checkout", to: "orders#new"

  resources :gifs, only: [:index, :show]

  resources :tags, only: [:index]
  get "/:name", :to => "tags#show", as: :tag

end
