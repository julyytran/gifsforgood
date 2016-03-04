Rails.application.routes.draw do

  get "/", to: "sessions#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  get "/cart", to: "cart_gifs#show"
  delete "/cart", to: "cart_gifs#destroy"
  get "/checkout", to: "orders#new"
  patch "/cart", to: "cart_gifs#update"

  resources :users, only: [:new, :create]
  resources :tags, only: [:index]
  resources :gifs, only: [:index, :show]
  resources :cart_gifs, only: [:create]
  resources :orders, only: [:index, :show, :create]

  get "/:name", :to => "tags#show", as: :tag

end
