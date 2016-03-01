Rails.application.routes.draw do
  resources :gifs, only: [:index]

  get '/:name', :to => "tags#show", as: :tag
end

# match '/:id', :to => "users#show", :as => :user
