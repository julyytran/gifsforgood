Rails.application.routes.draw do

  resources :tags, only: [:index]
  resources :gifs, only: [:index, :show]

  get '/:name', :to => "tags#show", as: :tag

end
