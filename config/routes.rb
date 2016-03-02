Rails.application.routes.draw do

  resources :tags, only: [:index]
  resources :gifs, only: [:index, :show]
  resources :cart_gifs, only: [:create]

  get '/:name', :to => "tags#show", as: :tag

end
