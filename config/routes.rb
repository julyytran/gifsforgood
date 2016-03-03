Rails.application.routes.draw do

  get "/", to: "sessions#index"
  # get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  get "/cart", to: "cart_gifs#show"
  delete "/cart", to: "cart_gifs#destroy"
  patch "/cart", to: "cart_gifs#patch"

  resources :users, only: [:new, :create]
  resources :tags, only: [:index]
  resources :gifs, only: [:index, :show]
  resources :cart_gifs, only: [:create]

  get "/:name", :to => "tags#show", as: :tag

end
